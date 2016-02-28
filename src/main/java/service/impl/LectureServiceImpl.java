package service.impl;

import dao.LectureDAO;
import dao.PersonLectureMapping;
import domain.Lecture;
import domain.Person;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.LectureService;
import util.ConstantUtil;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/20.
 */
@Service("LectureService")
public class LectureServiceImpl implements LectureService {

    @Autowired
    LectureDAO lectureDAO;

    @Autowired
    PersonLectureMapping personLectureMapping;

    SimpleDateFormat dateFormat = new SimpleDateFormat(ConstantUtil.DATE_FORMAT);


    @Override
    public void add(Lecture lecture) {
        lectureDAO.add(lecture);
    }

    @Override
    public void update(Lecture lecture) {
        lectureDAO.update(lecture);
    }

    @Override
    public void delete(Lecture lecture) {
        lectureDAO.delete(lecture);
    }

    @Override
    public Lecture retriveById(String id) {
        return lectureDAO.retriveById(Integer.parseInt(id));
    }

    @Override
    public int retriveCounts() {
        return lectureDAO.retriveCounts();
    }

    @Override
    public int retriveCountsByKey(String key) {
        return lectureDAO.retriveCountsByKey(key);
    }

    @Override
    public List<Lecture> retriveByPageNumber(String number) {
        return lectureDAO.retriveByPageNumber(Integer.parseInt(number));
    }

    @Override
    public List<Lecture> retriveByPageAndKey(String number, String key) {
        return lectureDAO.retrivePageAndKey(Integer.parseInt(number), key);
    }

    @Override
    public int retrivePageNumber() {
        return lectureDAO.retrivePageNumber();
    }

    @Override
    public int retrivePageNumberOfKey(String key) {
        return lectureDAO.retrivePageNumberByKey(key);
    }

    @Override
    public Map<String, Integer> getStartAndEnd(int targetPage, int pageNumber) {
        int start = targetPage - 2;
        int end = targetPage + 2;

        if (pageNumber > 5) {
            while (start < 1) {
                start++;
                end++;
            }
            while (end > pageNumber) {
                start--;
                end--;
            }
        } else {
            start = 1;
            end = pageNumber;
        }
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("start", start);
        map.put("end", end);
        return map;
    }

    @Override
    public String applyToJoinLecture(Person person, Lecture lecture) {
        String result = "申请失败！";
        try {
            if (lecture.getAccessable().equals("0")) {
                result = "该讲座可自由参加，不用申请！";
            } else if (personLectureMapping.isMapping(lecture, person)) {
                result = "您已经申请过了！";
            } else if ((new Date().after(dateFormat.parse(lecture.getTime())))) {
                result = "申请日期已经过期！";
            } else {
                result = "申请成功";
                personLectureMapping.addMapping(lecture, person);
            }
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public HSSFWorkbook exportParticipants(List<Person> persons) {

        String[] excelHeader = {"序号", "姓名", "班级"};

        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFSheet sheet = wb.createSheet("Participants");
        HSSFRow row = sheet.createRow(0);
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        for (int i = 0; i < excelHeader.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellValue(excelHeader[i]);
            cell.setCellStyle(style);
            sheet.autoSizeColumn(i);
        }

        for (int i = 0; i < persons.size(); i++) {
            row = sheet.createRow(i + 1);
            Person person = persons.get(i);
            row.createCell(0).setCellValue(i);
            row.createCell(1).setCellValue(person.getName());
            row.createCell(2).setCellValue(person.getClasses());
        }

        return wb;
    }
}
