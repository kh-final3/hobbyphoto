package com.kh.hobbyphoto.board.controller;


//import org.apache.commons.codec.binary.Base64;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
/*
@RestController
@RequestMapping("test")
public class Test {

    @PostMapping(value="/tt", produces = "apllication/json; charset=UTF-8")
    public byte[] saveImage(@RequestParam String imgBase64) {
        String png = new String(imgBase64);
        String find = "base64%2C";
        String tokens = png.substring(png.indexOf(find) + find.length());
        String decoded = StringUtils.replace(tokens, "%2F", "/");
        byte[] bytes = new Base64().decode(decoded);
        System.out.println(png);
        System.out.println(find);
        System.out.println(tokens);
        System.out.println(decoded);
        System.out.println(bytes);
        // 이미지 바이트 배열 반환
        return bytes;
    }
}
*/