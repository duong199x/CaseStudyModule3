package filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SesionAuth {
    public static boolean checkUser(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if(session != null){
            if (session.getAttribute("userAuth")!=null){
                return true;
            }
        }
        return false;
    }
    public static boolean chekAdmin(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if(session != null){
            if (session.getAttribute("adminAuth")!=null){
                return true;
            }
        }
        return false;
    }
}
