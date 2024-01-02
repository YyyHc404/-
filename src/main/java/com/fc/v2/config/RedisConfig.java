//package com.fc.v2.config;
//
//import org.springframework.boot.context.properties.ConfigurationProperties;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.data.redis.connection.RedisConnectionFactory;
//import org.springframework.data.redis.core.RedisTemplate;
//import org.springframework.data.redis.serializer.StringRedisSerializer;
//
//
//@Configuration
//public class RedisConfig {
//	@Bean
//	 public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory redisConnectionFactory) {
//        RedisTemplate<String, Object> template = new RedisTemplate();
//        template.setConnectionFactory(redisConnectionFactory);
//        //String序列化配置
//        StringRedisSerializer stringRedisSerializer = new StringRedisSerializer();
//        //key和hash的key都采用Stringd的序列化配置
//
//        template.setKeySerializer(stringRedisSerializer);
//        template.setHashKeySerializer(stringRedisSerializer);
//        template.afterPropertiesSet();
//        return template;
//    }
//}
