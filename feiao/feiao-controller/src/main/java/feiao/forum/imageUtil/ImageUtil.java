package feiao.forum.imageUtil;

import java.awt.Graphics;
import java.awt.GraphicsConfiguration;
import java.awt.GraphicsDevice;
import java.awt.GraphicsEnvironment;
import java.awt.HeadlessException;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.swing.ImageIcon;

import net.coobird.thumbnailator.Thumbnails;

public class ImageUtil {
	
	/**
	 * @param srcFile  原图路径
	 * @param desFile  压缩图片保存路径
	 * @return
	 */
	public static void compress(File srcFile, String desFile, int outputWidth, int outputHeight){
		try{
			byte[] imageData = toByteArray(new FileInputStream(srcFile));
			
			BufferedImage image = toBufferedImage(imageData);
			
			//输入图片
			File outFile = new File(desFile);
			createPath(outFile, true);
			resizeImage(image, outputWidth, outputHeight, 1.0f, outFile);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//把原图转换成二进制
	private static byte[] toByteArray(InputStream input) {
 		if (input == null) {
 			return null;
 		}
 		ByteArrayOutputStream output = null;
 		byte[] result = null;
 		try {
 			output = new ByteArrayOutputStream();
 			byte[] buffer = new byte[1024 * 100];
 			int n = 0;
 			while (-1 != (n = input.read(buffer))) {
 				output.write(buffer, 0, n);
 			}
 			result = output.toByteArray();
 			if (output != null) {
				output.close();
			}
 		} catch (Exception e) {}
 		return result;
 	}
	//把二进制转换成图片
	private static BufferedImage toBufferedImage(byte[] imagedata) {
 		Image image = Toolkit.getDefaultToolkit().createImage(imagedata);
 		if (image instanceof BufferedImage) {
 			return (BufferedImage) image;
 		}
 		image = new ImageIcon(image).getImage();
 		BufferedImage bimage = null;
 		GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
 		try {
 			int transparency = Transparency.OPAQUE;
 			GraphicsDevice gs = ge.getDefaultScreenDevice();
 			GraphicsConfiguration gc = gs.getDefaultConfiguration();
 			bimage = gc.createCompatibleImage(image.getWidth(null), image.getHeight(null), transparency);
 		} catch (HeadlessException e) {
 		}
 		if (bimage == null) {
 			int type = BufferedImage.TYPE_INT_RGB;
 			bimage = new BufferedImage(image.getWidth(null), image.getHeight(null), type);
 		}
 		Graphics g = bimage.createGraphics();
 		g.drawImage(image, 0, 0, null);
 		g.dispose();
 		return bimage;
 	}
	/**
	 * 创建输出目录
	 * @param file
	 * @param asFile
	 * @throws IOException
	 */
	private static void createPath(File file, boolean asFile) throws IOException {
		String path = file.getAbsolutePath();
		String dirPath;
		if (asFile)
			dirPath = path.substring(0, path.lastIndexOf(File.separator));
		else {
			dirPath = path;
		}
		File dir = new File(dirPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		if (asFile)
			file.createNewFile();
	}
	
	/**
	 * 借助第三方工具输出图片
	 * @param sourceImage
	 * @param width
	 * @param height
	 * @param quality
	 * @param destFile
	 * @throws IOException
	 */
	private static void resizeImage(final BufferedImage sourceImage, final int width, final int height, final float quality, final File destFile) throws IOException {
 		try {
 			Thumbnails.of(sourceImage).size(width, height).keepAspectRatio(false).outputQuality(quality).toFile(destFile);
 		} catch (IllegalStateException e) {
 			Thumbnails.of(sourceImage).size(width, height).keepAspectRatio(false).toFile(destFile);
 		}
 	}
}
