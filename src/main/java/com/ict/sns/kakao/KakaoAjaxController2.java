package com.ict.sns.kakao;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

@RestController
public class KakaoAjaxController2 {
	
	@RequestMapping(value = "kakaoUser2.do", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String memberChk(HttpSession session) {
		
		String access_token = (String) session.getAttribute("access_token"); //여권
		String apiURL = "https://kapi.kakao.com/v2/user/me"; // 여권 보여주는 장소
		
		try {
			URL url = new URL(apiURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			//Post 요청
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			//해더요청
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setRequestProperty("Authorization", "Bearer " + access_token);
			
			
			
			//	200 이면 성공과 같은 의미 (HttpURLConnection.HTTP_OK)
			int responseCode = conn.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				
				String line="";
				StringBuffer sb = new StringBuffer();
				while((line=br.readLine()) != null) {
					sb.append(line);
				}
				String result = sb.toString();
				
				Gson gson = new Gson();
				
				KakaoUserVO kvo = gson.fromJson(result, KakaoUserVO.class);
				
				String kakao_id = kvo.getId();
				String kakao_nickname = kvo.getProperties().getNickname();
				String kakao_email = kvo.getKakao_account().getEmail();
				
				return kakao_id+"/"+kakao_nickname+"/"+kakao_email;
			
			}
			
		} catch (Exception e) {
			System.out.println("연결실패");
		}
		return null;
	}
}