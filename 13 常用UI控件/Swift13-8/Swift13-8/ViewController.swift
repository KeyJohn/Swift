//
//  ViewController.swift
//  Swift13-8
//
//  Created by keyzhang on 15/8/2.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    let screenHeight = UIScreen.mainScreen().bounds.size.height
    
    var imageView: UIImageView?
    var specialBtn: UIButton?
    var navigationView: UIImageView?
    var progressView: UIImageView?
    var playbarView: UIImageView?
    var volumSlider: UISlider!
    
    var audioPlayer: AVAudioPlayer!
    
    var timer: NSTimer!
    
    var lastPlayIndex: NSInteger = 0
    
    
    let imageNames = ["chenyixun.jpg", "gaga.jpg", "gem.jpeg", "wanglihong.jpg", "jay.jpg"]
    
    let songNames = ["浮夸", "Bad Romance", "多远都要在一起", "你不知道的事", "七里香"]
    
    let singerNames = ["陈奕迅", "Lady Gaga", "邓紫棋", "王力宏", "周杰伦"]
    
    var index = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //创建背景视图
        self._initBackgroundView()
        //创建顶部导航栏视图
        self._initNavigationbar()
        //创建进度工具栏视图
        self._initProgressbar()
        //播放视图
        self._initPlayBar()
        
        
        let mp3Path = NSBundle.mainBundle().pathForResource(songNames[index], ofType: "mp3")
        let fileURL = NSURL.fileURLWithPath(mp3Path!)
        
        audioPlayer = try! AVAudioPlayer(contentsOfURL: fileURL)
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        
        //音量滑块
        self._initVolumSlider()

        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "timeAction", userInfo: nil, repeats: true)
    }
    
    //MARK: 创建背景视图
    func _initBackgroundView() {
        //如果将一个图片转成颜色对象，图片尺寸不够时，图片会平铺显示
//        if let image: UIImage = UIImage(named: "audio_bg-Decoded.png") {
//            self.view.backgroundColor = UIColor(patternImage: image)
//        }
        //1.创建了背景视图
        if let image: UIImage = UIImage(named: imageNames[0]) {
            imageView = UIImageView(image: image)
            imageView!.frame = UIScreen.mainScreen().bounds
            self.view.addSubview(imageView!)
        }
        //2.创建专辑图片
        let borderView = UIImageView(frame: CGRectMake((screenWidth-207)/2, (screenHeight-207)/2, 207, 207))
        borderView.image = UIImage(named: "audio_cover_bg-Decoded.png")
        borderView.userInteractionEnabled = true
        self.view.addSubview(borderView)
        
        let specialView = UIImageView(frame: CGRectMake(10, 10, 185, 185))
        specialView.image = UIImage(named: imageNames[0])
        borderView.addSubview(specialView)
        
        specialBtn = UIButton(type: UIButtonType.Custom)
        specialBtn?.frame = specialView.frame
        specialBtn?.setBackgroundImage(specialView.image, forState: UIControlState.Normal)
        specialBtn?.addTarget(self, action: "specialBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        borderView.addSubview(specialBtn!)
    }
    
    func specialBtnClick(btn: UIButton) {
        btn.selected = !btn.selected
        if btn.selected {
            let image = btn.backgroundImageForState(UIControlState.Normal)
            imageView?.image = image
            
            //隐藏其它控件
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.navigationView?.alpha = 0
                self.progressView?.alpha = 0
                self.playbarView?.alpha = 0
                self.volumSlider.alpha = 0
                
            })

        }else {
//            imageView?.image = UIImage(named: "audio_bg-Decoded.png")
            //显示其它控件
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.navigationView?.alpha = 1
                self.progressView?.alpha = 1
                self.playbarView?.alpha = 1
                self.volumSlider.alpha = 1
            })

        }
        
        
    }
    
    //MARK: 创建顶部导航栏视图
    func _initNavigationbar() {
        //1.创建导航栏背景视图(父视图)
        navigationView = UIImageView(image: UIImage(named: "audio_bg_up-Decoded.png"))
        navigationView?.frame = CGRectMake(0, 0, screenWidth, 84)
        navigationView?.userInteractionEnabled = true
        self.view.addSubview(navigationView!)
        //2.创建左边按钮
        let leftBtn = UIButton(type: UIButtonType.Custom)
        leftBtn.setImage(UIImage(named: "audio_btn_back_n-Decoded.png"), forState: UIControlState.Normal)
        leftBtn.setImage(UIImage(named: "audio_btn_back_h-Decoded.png"), forState: UIControlState.Highlighted)
        leftBtn.frame = CGRectMake(0, 30, 80, 44)
        leftBtn.addTarget(self, action: "backAction:", forControlEvents: UIControlEvents.TouchUpInside)
        navigationView?.addSubview(leftBtn)
        
        //3.右边按钮
        let rightBtn = UIButton(type: UIButtonType.Custom)
        rightBtn.setImage(UIImage(named: "audio_btn_love-Decoded.png"), forState: UIControlState.Normal)
        rightBtn.setImage(UIImage(named: "audio_btn_love_h-Decoded.png"), forState: UIControlState.Selected)
        rightBtn.frame = CGRectMake(screenWidth - 80, 30, 80, 44)
        rightBtn.addTarget(self, action: "loveAction:", forControlEvents: UIControlEvents.TouchUpInside)
        navigationView?.addSubview(rightBtn)
        
        //4.歌手、歌名
        let songLabel = UILabel(frame: CGRectMake((screenWidth - 180) / 2, 30, 180, 25))
        songLabel.tag = 111
        songLabel.backgroundColor = UIColor.clearColor()
        songLabel.text = songNames[0]
        songLabel.textColor = UIColor.whiteColor()
        songLabel.textAlignment = NSTextAlignment.Center
        songLabel.font = UIFont.boldSystemFontOfSize(18)
        navigationView?.addSubview(songLabel)
        
        let singerLabel = UILabel(frame: CGRectMake((screenWidth - 180) / 2, 55, 180, 25))
        singerLabel.tag = 222
        singerLabel.backgroundColor = UIColor.clearColor()
        singerLabel.text = singerNames[0]
        singerLabel.textColor = UIColor.whiteColor()
        singerLabel.textAlignment = NSTextAlignment.Center
        singerLabel.font = UIFont.boldSystemFontOfSize(14)
        navigationView?.addSubview(singerLabel)
    }
    
    //MARK: naviBtn Click
    func backAction(btn: UIButton) {
        print("back")
    }
    
    func loveAction(btn: UIButton) {
        btn.selected = !btn.selected
    }
    
    
    //MARK: 创建进度工具栏视图
    func _initProgressbar() {
        progressView = UIImageView(image: UIImage(named: "audio_bg_down-Decoded.png"))
        progressView?.frame = CGRectMake(0, 84 + 24, screenWidth, 97)
        progressView?.userInteractionEnabled = true
        self.view.addSubview(progressView!)
        
        //创建时间Label
        let progressLabel = UILabel(frame: CGRectMake(10, 20, 50, 20))
        progressLabel.tag = 11
        progressLabel.text = "00:00"
        progressLabel.textColor = UIColor.whiteColor()
        progressLabel.backgroundColor = UIColor.clearColor()
        progressLabel.font = UIFont.boldSystemFontOfSize(14)
        progressLabel.sizeToFit()
        progressView?.addSubview(progressLabel)
        
        //滑块
        let slider = UISlider(frame: CGRectMake(55, 20, screenWidth - 110, 20))
        slider.tag = 333
        var minImg = UIImage(named: "com_slider_min_l-Decoded.png")
        var maxImg = UIImage(named: "com_slider_min_r-Decoded.png")
        minImg = minImg?.stretchableImageWithLeftCapWidth(5, topCapHeight: 0)
        maxImg = maxImg?.stretchableImageWithLeftCapWidth(5, topCapHeight: 0)
        slider.setMaximumTrackImage(maxImg, forState: UIControlState.Normal)
        slider.setMinimumTrackImage(minImg, forState: UIControlState.Normal)
        slider.setThumbImage(UIImage(named: "com_thumb_max_n-Decoded.png"), forState: UIControlState.Normal)
        slider.setThumbImage(UIImage(named: "com_thumb_max_h-Decoded.png"), forState: UIControlState.Highlighted)
        slider.addTarget(self, action: "sliderAction:", forControlEvents: UIControlEvents.ValueChanged)
        progressView?.addSubview(slider)
        
        
        
        let timeLabelLeft = slider.frame.size.width + slider.frame.origin.x + 5
        let timeLabel = UILabel(frame: progressLabel.frame)
        timeLabel.tag = 12
        timeLabel.frame.origin.x = timeLabelLeft
        timeLabel.text = "00:00"
        timeLabel.textColor = UIColor.whiteColor()
        timeLabel.backgroundColor = UIColor.clearColor()
        timeLabel.font = UIFont.boldSystemFontOfSize(14)
        timeLabel.sizeToFit()
        progressView?.addSubview(timeLabel)
        
    }
    
    //MARK: progressView Action
    func sliderAction(slider: UISlider) {
        audioPlayer.currentTime = NSTimeInterval(slider.value * Float(audioPlayer.duration))
        audioPlayer.play()
    }
    
    //MARK: 音量滑块
    func _initVolumSlider() {
        //音量滑块
        volumSlider = UISlider(frame: CGRectMake(-70, 330, 210, 20))
        volumSlider.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI / 2))
        volumSlider.value = audioPlayer.volume
        volumSlider.addTarget(self, action: "volumSliderAction:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(volumSlider)

    }
    
    func volumSliderAction(slider: UISlider) {
        if audioPlayer == nil {
            return
        }
        audioPlayer.volume = slider.value
    }
    
    //MARK: 播放视图
    func _initPlayBar() {
        playbarView = UIImageView(image: UIImage(named: "audio_bg_down-Decoded.png"))
        playbarView?.frame = CGRectMake(0, screenHeight-90, screenWidth, 90)
        playbarView?.userInteractionEnabled = true
        self.view.addSubview(playbarView!)
        
        //上一首按钮
        let lastBtn = UIButton(type: UIButtonType.Custom)
        lastBtn.tag = 100
        lastBtn.frame = CGRectMake(40, 30, 33, 24)
        lastBtn.setImage(UIImage(named: "audio_btn_pre_n-Decoded.png"), forState: UIControlState.Normal)
        lastBtn.setImage(UIImage(named: "audio_btn_pre_h-Decoded.png"), forState: UIControlState.Highlighted)
        lastBtn.addTarget(self, action: "passSong:", forControlEvents: UIControlEvents.TouchUpInside)
        playbarView?.addSubview(lastBtn)
        //下一首按钮
        let nextBtn = UIButton(type: UIButtonType.Custom)
        nextBtn.tag = 101
        nextBtn.frame = CGRectMake(screenWidth - 40 - 33, 30, 33, 24)
        nextBtn.setImage(UIImage(named: "audio_btn_next_n-Decoded.png"), forState: UIControlState.Normal)
        nextBtn.setImage(UIImage(named: "audio_btn_next_h-Decoded.png"), forState: UIControlState.Highlighted)
        nextBtn.addTarget(self, action: "passSong:", forControlEvents: UIControlEvents.TouchUpInside)
        playbarView?.addSubview(nextBtn)

        //播放按钮
        let playBtn = UIButton(type: UIButtonType.Custom)
        playBtn.tag = 102
        playBtn.selected = true
        playBtn.frame = CGRectMake((screenWidth - 33) / 2, 30, 33, 24)
        playBtn.setImage(UIImage(named: "audio_btn_pause_n-Decoded.png"), forState: UIControlState.Selected)
        playBtn.setImage(UIImage(named: "audio_btn_play_n-Decoded.png"), forState: UIControlState.Normal)
        playBtn.addTarget(self, action: "playSong:", forControlEvents: UIControlEvents.TouchUpInside)
        playbarView?.addSubview(playBtn)
    }
    
    func passSong(btn: UIButton) {
        
        if btn.tag == 100 {
            index--
            if index < 0 {
                index = imageNames.count - 1
            }
        }else if btn.tag == 101 {
            index++
            if index == imageNames.count {
                index = 0
            }
        }
        
        let img = UIImage(named: imageNames[index])
        specialBtn?.setBackgroundImage(img, forState: UIControlState.Normal)
        specialBtn?.selected = false
        imageView?.image = img
        
        let btn = playbarView?.viewWithTag(102) as! UIButton
        btn.selected = false
        self.playSong(btn)
        
        lastPlayIndex = index
    }
    
    func playSong(btn: UIButton) {
        
        btn.selected = !btn.selected
        
        if btn.selected {
            print("play")
            
            if lastPlayIndex != index{
                let mp3Path = NSBundle.mainBundle().pathForResource(songNames[index], ofType: "mp3")
                let fileURL = NSURL.fileURLWithPath(mp3Path!)
                
                audioPlayer = try! AVAudioPlayer(contentsOfURL: fileURL)
                audioPlayer.delegate = self
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                
                let songLabel = navigationView?.viewWithTag(111) as! UILabel
                let singerLabel = navigationView?.viewWithTag(222) as! UILabel
                songLabel.text = songNames[index]
                singerLabel.text = singerNames[index]
                
            } else {
                audioPlayer.play()
            }
            
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timeAction", userInfo: nil, repeats: true)
            
            
        }else {
            print("pause")
            audioPlayer.pause()
            
            timer.invalidate()
        }
    }
    
    func timeAction() {
        //获取音频播放器播放的进度，单位秒
        let cuTime: Float = Float(audioPlayer.currentTime)
        
        //获取总时间
        let duTime: Float = Float(audioPlayer.duration)
        
        //剩余时间
        let minusTime = duTime - cuTime
        
        //播放时间秒数
        let minute: Int = Int(cuTime / 60)
        let second: Int = Int(cuTime % 60)
        
        //总时间秒数
        let minute1: Int = Int(minusTime / 60)
        let second1: Int = Int(minusTime % 60)
        
        let playTimeStr = NSString(format: "%.2d:%.2d", minute, second)
        let allTimeStr = NSString(format: "%.2d:%.2d", minute1, second1)
        
        let label1 = progressView?.viewWithTag(11) as! UILabel
        let label2 = progressView?.viewWithTag(12) as! UILabel
        
        label1.text = playTimeStr as String
        label2.text = allTimeStr as String
        
        let slider = progressView?.viewWithTag(333) as! UISlider
        slider.value = cuTime / duTime
    }


    
    //MARK: AVAudioPlayerDelegate
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        let btn = playbarView?.viewWithTag(101) as! UIButton
        self.passSong(btn)
    }
    

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

