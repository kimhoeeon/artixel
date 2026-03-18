package com.mtf.artixel.dto;

import com.mtf.artixel.vo.DevFileVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Data
public class MailRequestDTO {
    private String subject;
    private String body;
    private List<Receiver> receiver;
    private String template;
    private List<DevFileVO> fileUrl;

    @Data
    @NoArgsConstructor // 매개변수가 없는 기본 생성자 생성 (new Receiver() 에러 해결)
    @AllArgsConstructor // 모든 필드를 받는 생성자 생성
    public static class Receiver {
        private String name;
        private String email;
        private String mobile;

        // 기존에 사용하시던 2개짜리 커스텀 생성자도 안전하게 유지합니다.
        public Receiver(String name, String email) {
            this.name = name;
            this.email = email;
        }
    }
}