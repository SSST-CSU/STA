package dao.impl;

import dao.PersonLectureMapping;
import domain.Lecture;
import domain.Person;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/1/24.
 */
@Component
public class PersonLectureMappingHibernate4 extends BaseDaoHibernate4 implements PersonLectureMapping {
    @Override
    public void addMapping(Lecture lecture, Person person) {
        Session session = getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        Lecture l = (Lecture) session.get(Lecture.class, lecture.getId());
        Person p = (Person) session.get(Person.class, person.getId());

        l.getPersonList().add(p);
        p.getLectures().add(l);

        transaction.commit();
    }

    @Override
    public void deleteMapping(Lecture lecture, Person person) {
        Session session = getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        Lecture l = (Lecture) session.get(Lecture.class, lecture.getId());
        Person p = (Person) session.get(Person.class, person.getId());

        l.getPersonList().remove(p);
        p.getLectures().remove(l);

        transaction.commit();
    }

    /**
     * 判断用户是否已经申请参加了讲座
     *
     * @param lecture
     * @param person
     * @return
     */
    @Override
    public boolean isMapping(Lecture lecture, Person person) {

        Session session = getSessionFactory().getCurrentSession();

        Query query = session.createSQLQuery("SELECT * FROM lecture_person WHERE lecture_id = ? and person_id = ?");
        query.setInteger(0,lecture.getId());
        query.setInteger(1,person.getId());

        List result = query.list();
        System.out.println(result.size());
        if (result.size()==1){
            return true;
        }else return false;
    }
}
