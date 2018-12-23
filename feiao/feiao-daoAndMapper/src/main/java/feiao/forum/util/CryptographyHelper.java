package feiao.forum.util;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;


/**
 * 密码算法帮助类
 * @author LEE.SIU.WAH
 * @email lixiaohua7@163.com
 * @date 2016年12月20日 上午11:57:25
 * @version 1.0
 */
public final class CryptographyHelper {
	/** 定义一个安全随机数据生成器 */
	private static SecureRandomNumberGenerator generator = new SecureRandomNumberGenerator();
	/** 加密迭代次数 */
	private static final int HASH_ITERATIONS = 5;
	/** 加密算法名称 md5、 sha-1、sha-256、sha-384、sha-512 */
	private static final String ALGORITHM_NAME ="md5";
	
	/** 获取随机的加密盐 */
	public static String getRandomSalt(){
		return generator.nextBytes().toHex();
	}
	
	/**
	 * 加密的方法
	 * @param source 明文
	 * @param salt 加密盐
	 * @return 返回16进制的加密字符串
	 */
	public static String encrypt(String source, String salt){
		return new SimpleHash(ALGORITHM_NAME, source, salt, HASH_ITERATIONS).toHex();
	}
	
	
}
