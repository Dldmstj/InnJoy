package com.web.innjoy.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.web.innjoy.model.Board_Img;
import com.web.innjoy.model.Pro_Img;
import com.web.innjoy.model.Review_Img;
import com.web.innjoy.repository.ProImgRepository;
import com.web.innjoy.repository.RecommRepository;
import com.web.innjoy.repository.ReviewImgRepository;

@Service
public class FileUploadService {

	@Autowired
	private ReviewImgRepository rImgRepository;
	@Autowired
	private RecommRepository recImgRepository;
	@Autowired
	private ProImgRepository pImgRepository;
	
	@Value("${upload}")
	private String path;
	
	// 리뷰 이미지 업로드
	public String uploadReviewFile(List<MultipartFile> mfs, int reviewId) {
		String msg="업로드 성공";
		//  파일객체 만들기
		for(MultipartFile mf : mfs) {
			String fname = mf.getOriginalFilename();
			File upFile = new File(path + fname);
			// 파일 객체 생성해서 DB에 저장
			Review_Img rImg = new Review_Img(fname,reviewId);
			rImgRepository.save(rImg);
			System.out.println("reviewId : " + reviewId);
			try {
				// 실제 파일이 생성됨
				mf.transferTo(upFile);
			} catch (IllegalStateException e) {
				System.out.println(e.getMessage());
				msg="업로드 에러:"+e.getMessage()+"\n";
			} catch (IOException e) {
				System.out.println("#파일업로드에러발생#");
				System.out.println(e.getMessage());
				msg="업로드 에러:"+e.getMessage()+"\n";
			}
		}
		return msg;
	}
	
	// 리뷰 이미지 수정
	
	// 게시물 이미지 업로드
	public String uploadRcomFile(List<MultipartFile> mfs, int recommId) {
		String msg="업로드 성공";
		//  파일객체 만들기
		for(MultipartFile mf : mfs) {
			String fname = mf.getOriginalFilename();
			File upFile = new File(path + fname);
			// 파일 객체 생성해서 DB에 저장
			Board_Img bImg = new Board_Img(fname,recommId);
			recImgRepository.save(bImg);
			System.out.println("recommId : " + recommId);
			try {
				// 실제 파일이 생성됨
				mf.transferTo(upFile);
			} catch (IllegalStateException e) {
				System.out.println(e.getMessage());
				msg="업로드 에러:"+e.getMessage()+"\n";
			} catch (IOException e) {
				System.out.println("#파일업로드에러발생#");
				System.out.println(e.getMessage());
				msg="업로드 에러:"+e.getMessage()+"\n";
			}
		}
		return msg;
	}
	
	// 상품 이미지 업로드
	public String uploadProFile(List<MultipartFile> mfs, int proId) {
		String msg="업로드 성공";
		//  파일객체 만들기
		for(MultipartFile mf : mfs) {
			String fname = mf.getOriginalFilename();
			File upFile = new File(path + fname);
			// 파일 객체 생성해서 DB에 저장
			Pro_Img pImg = new Pro_Img(fname,proId);
			pImgRepository.save(pImg);
			System.out.println("reviewId : " + proId);
			try {
				// 실제 파일이 생성됨
				mf.transferTo(upFile);
			} catch (IllegalStateException e) {
				System.out.println(e.getMessage());
				msg="업로드 에러:"+e.getMessage()+"\n";
			} catch (IOException e) {
				System.out.println("#파일업로드에러발생#");
				System.out.println(e.getMessage());
				msg="업로드 에러:"+e.getMessage()+"\n";
			}
		}
		return msg;
	}
	
	// 게시물 이미지 수정
}
