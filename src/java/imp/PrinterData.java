/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package imp;

import entity.Technician;
import java.util.List;
import models.TechnicianDA;
import models.ViewModelDA;
import viewModel.ComplaintDetailViewModel;
import viewModel.ComplaintViewModel;

/**
 *
 * @author Hoanvd
 */
public class PrinterData {

    public String put() {
       // List<ComplaintViewModel> list = new ViewModelDA().
        String content = "<table> "
                + "<thead>"
                + "<tr>"
                + "<th>Solved</th>"
                + "<th>Title</th>"
                + "<th>SubmitedDate</th>"
                + "<th>SolvedDate</th>"
                + "<th>Technician</th>"
                + "<th>Priority</th>"
                + "<th>Rate</th>"
                + "</tr>"
                + "</thead>"
                + "<tbody>"
                + " <tr><td>Yes</td>"
                + " <td>Hong o cung sua chua ngay</td>"
                + " <td>10-12-2011</td>"
                + " <td>11-12-2011</td>"
                + " <td>HongLam2</td>"
                + " <td>Ghegom</td><"
                + " <td>5sao</td></tr>"
                + "</tbody>"
                + "</table>";
        return content;
    }

    public String getDllTechnician() {
        StringBuilder sb = new StringBuilder();
        List<Technician> listDep = new TechnicianDA().getTechnicians();
        sb.append("<select id='slTechnician'>");
        sb.append("<option value='-1'>Pending...</option>");
        for (Technician tech : listDep) {
            sb.append("<option value='").append(tech.getPersonId()).append("'>").append(tech.getUserName()).append("</otion>");
        }
        sb.append("</select>");
        return sb.toString();
    }
}
