
package MyTag;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;


public class NewTagHandler extends SimpleTagSupport {

    /**
     * Called by the container to invoke this tag. The implementation of this
     * method is provided by the tag library developer, and handles all tag
     * processing, body iteration, etc.
     */
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();
        
        try {
            // TODO: insert code to write html before writing the body content.
            // e.g.:
            //
            // out.println("<strong>" + attribute_1 + "</strong>");
            // out.println("    <blockquote>");

            JspFragment f = getJspBody();
            
            String dateFormat = "yyyy-MM-dd";
                    DateFormat df = new SimpleDateFormat(dateFormat);
                    df.setLenient(false);
                    LocalDateTime current = LocalDateTime.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern(dateFormat);
                    String now = current.format(formatter);
                    out.print(now);
            if (f != null) {
                f.invoke(out);
            }

            // TODO: insert code to write html after writing the body content.
            // e.g.:
            //
            // out.println("    </blockquote>");
        } catch (java.io.IOException ex) {
            throw new JspException("Error in NewTagHandler tag", ex);
        }
    }
//    public String getDate(){
//                    String dateFormat = "MM-dd-yyyy";
//                    DateFormat df = new SimpleDateFormat(dateFormat);
//                    df.setLenient(false);
//                    LocalDateTime current = LocalDateTime.now();
//                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern(dateFormat);
//                    String now = current.format(formatter);
//                    return now;
//    }
//    public static void main(String[] args) {
//        NewTagHandler m = new NewTagHandler();
//        System.out.println(m.getDate());
//    }
}
