package com.mtf.artixel.config;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class NaverCloudConfig {

    @Value("${naver.cloud.endpoint}")
    private String endpoint;

    @Value("${naver.cloud.region}")
    private String region;

    @Value("${naver.cloud.access-key}")
    private String accessKey;

    @Value("${naver.cloud.secret-key}")
    private String secretKey;

    @Bean
    public AmazonS3 amazonS3() {
        // 1. 자격 증명 객체 생성
        BasicAWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);

        // 2. S3 호환 클라이언트 빌드 및 반환
        return AmazonS3ClientBuilder.standard()
                .withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(endpoint, region))
                .withCredentials(new AWSStaticCredentialsProvider(credentials))
                .build();
    }
}