/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import bean.ComponentBean;
import bean.ViewModelBean;
import entity.Account;
import entity.Article;
import entity.Department;
import entity.Diary;
import entity.Technician;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONObject;
import viewModel.ComplaintDetailViewModel;
import viewModel.ComplaintViewModel;

/**
 *
 * @author Hoanvd
 */
public class Main {

//    private  static String urlEncode(String value, String charset) throws UnsupportedEncodingException {
//        return URLEncoder.encode(value, charset);
//    }

    public static void main(String[] args) {
    
            
            boolean res = new DiaryDA().editDiary(19, "Fixed","Da sua","01-16-2012","Easy");
            System.out.println(res);
//            String url = urlEncode("http:/www.MantechSite/con?action=login", "UTF-8");
//            System.out.println(url);
//            String url2 = URLEncoder.encode("http:/www.MantechSite/con?action=login", "UTF-8");
//            System.out.println(url2);
    //        JSONObject o = new JSONObject();
    //        o.put("priority",1);
    //        o.put("technician","Nguyen van a");
    //        System.out.print(o.toString());
    //        
    //        String cm = new ViewModelDA().ggg("ALL","");
    //        System.out.println(cm);
    //        List<ComplaintViewModel> cm = new ViewModelDA().getComplaintModel("ALL","technician2");
    //        for (ComplaintViewModel complaintViewModel : cm) {
    //            System.out.println(complaintViewModel.getContentId());
    //        }
    //        Article ar = new ArticleDA().getArticle(16);
    //        System.out.println(ar.getSubmitedDate());
    //        System.out.println(ar.getContentId());
    //        System.out.println(ar.getPersonId());
    //        System.out.println(ar.getContent());
    //        Account ac = new AccountDA().getAccount("peter","aaaaaa");
    //        System.out.println(ac.getAccountType());
    //        List<ComplaintViewModel> c = new ViewModelBean().getListComplaintViewModel();
    //        for (ComplaintViewModel complaintViewModel : c) {
    //            System.out.println(complaintViewModel.getSubmitedBy());
    //        }
    //        ComponentBean cp = new ComponentBean();
    //        cp.setContentId(1);
    //        Diary d = cp.getDiary();
    //        System.out.println(d.isIsActive());
            //Diary d = new DiaryDA().getDiary(1);
            //System.out.println("DI: " + d.getPriority());
    //
    //SimpleDateFormat f= new SimpleDateFormat("MM-dd-yyyy");
    //Date d = new Date();
    //
    //      SimpleDateFormat sl = new SimpleDateFormat();
    //System.out.println( f.format(d));
    //SimpleDateFormat f2 = new SimpleDateFormat("MM/dd/yyyy");
    //        
    //        List<Technician> list = new TechnicianDA().getTechnicians();
    //        for (Technician t : list) {
    //            System.out.println(t.getFullName());
    //        }
    //        ComponentBean cm = new ComponentBean();
    //        cm.setDepartmentId(1);
    //        Department da = cm.getDerpatment();
    //        System.out.println(da.getName());
    //        Account account = new AccountDA().getAccount("technician1", "aaabbb");
    //        System.out.println(account.getAddress());
    ///boolean res = new EmployeeDA().insert("technici23","123456","vu duch hoan", "daylaemail", f.format(d),f.format(d), "day la dia chi cua toi", 1);
    //System.out.println(res);
    //        List<Employee> list = new EmployeeBean().getList();
    //        System.out.println(list.size());
    //        for (Employee t : list) {
    //            System.out.println(t.getPersonId());
    //            System.out.println(t.getUserName());
    //            System.out.println(t.getPassword());
    //            System.out.println(t.getFullName());
    //            System.out.println(t.getJoinedDate());
    //            System.out.println(t.getDepartmentId());
    //            System.out.println(t.getBirthDate());
    //            System.out.println(t.getAddress());
    //            System.out.println(t.getUserName());
    //        }
    //        
    //        
            //  boolean res = new EmployeeDA().isUserExits("technician2");
            // System.out.println("Exits :" + res);
            //boolean res = new DiaryDA().insertComplaint(1, 1, "waitting", null, null, null);
            // boolean res = new DiaryDA().editDiary(1,"Fixed","loi do chuot gam cac phich cam","2012-10-10","Easy");
    //        List<Category> list = new ComponentBean().getListCategory();
    //        for (Category g : list) {
    //            System.out.println(g.getName());
    //        }
    //        List<ComplaintViewModel> list = new ViewModelBean().getListComplaintViewModel();
    //        for (ComplaintViewModel com : list) {
    //        }
    //        }
    }
}
//
// //boolean res = new ComplaintDA().insertComplaint("Hong o cung", "COntent: rat nhieu may bi hong o cung", 1, "2012-12-12", 1);
//        
//        List<Complaint> list = new ComplaintDA().getComplaints();
//        for (Complaint p : list) {
//            System.out.println("ID : " +p.getContentId());
//            System.out.println("Title : " +p.getTitle());
//            System.out.println("content : " +p.getContent());
//            System.out.println("categoryId : " +p.getCategoryId());
//            System.out.println("submitedDate : " +p.getSubmitedDate());
//            System.out.println("personId : " +p.getPersonId());
//        }
// test  boolean res = new EmployeeDA().insert("Employee2","aaabbb","Tran Van Troi", "troivt23@gmail.com", 25, "1988-10-10","2000-10-10", "That nghiep loi mat, ko co dia chi", 1);


////       boolean res = new TechnicianDA().insert("technician1","aaabbb","Tran Ba Dao", "vanluyen33@gmail.com", 25, "1988-10-10","2000-10-10", "That nghiep loi mat, ko co dia chi",1 );
