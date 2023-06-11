package tn.iit.teacher_authorization_management.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;

import org.apache.pdfbox.io.IOUtils;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;

import tn.iit.teacher_authorization_management.Admin;
import tn.iit.teacher_authorization_management.Professor;

public class PDFGenerator {
	public static ByteArrayOutputStream generatePDF(Professor professor, Admin admin) {
		int weeksLeft = 52 - Calendar.getInstance().get(Calendar.WEEK_OF_YEAR);
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		try {
			PDDocument document = new PDDocument();
			PDPage page = new PDPage(PDRectangle.A4);
			document.addPage(page);

			PDPageContentStream contentStream = new PDPageContentStream(document, page);
			InputStream imageStream = PDFGenerator.class.getClassLoader().getResourceAsStream("logo.png");
			PDImageXObject logoImage = PDImageXObject.createFromByteArray(document, IOUtils.toByteArray(imageStream),
					"logo");

			contentStream.drawImage(logoImage, 25, 775, 50, 50);

			contentStream.setFont(PDType1Font.TIMES_BOLD, 25);
			contentStream.beginText();
			contentStream.newLineAtOffset(200, 800);
			contentStream.showText("Work Authorization");
			contentStream.endText();

			contentStream.setFont(PDType1Font.TIMES_ROMAN, 12);
			contentStream.setLeading(15f);
			contentStream.beginText();
			contentStream.newLineAtOffset(50, 650);

			String introText = "I, " + admin.getUsername() + ", the undersigned hereby acknowledge that Professor "
					+ professor.getFirstName() + " " + professor.getLastName() + " of ID " + professor.getCin()
					+ " is allowed " + weeksLeft * 4 + " working hours  for expertise activities and/or"
					+ " training in continuing vocational education and training.";
			float maxWidth = 500;

			String[] words = introText.split("\\s+");
			StringBuilder line = new StringBuilder();
			for (String word : words) {
				float width = PDType1Font.TIMES_ROMAN.getStringWidth(line.toString() + " " + word) / 1000 * 12;
				if (width > maxWidth) {
					contentStream.showText(line.toString().trim());
					contentStream.newLine();
					line = new StringBuilder(word + " ");
				} else {
					line.append(word).append(" ");
				}
			}
			contentStream.showText(line.toString().trim());
			contentStream.setLeading(25f);
			contentStream.newLine();
			contentStream.setFont(PDType1Font.TIMES_BOLD, 15);
			contentStream.showText("Signature: ");
			contentStream.newLine();
			contentStream.showText("_______________");
			contentStream.endText();
			contentStream.close();

			document.save(outputStream);
			document.close();
			System.out.println("PDF generated successfully.");

		} catch (IOException e) {
			e.printStackTrace();
		}
		return outputStream;

	}
}