package domain;

import javax.persistence.*;

/**
 * Created by martsforever on 2016/1/13.
 */
@Entity
@Table(name = "resource",catalog = "sta")
public class Resource {
    private int id;
    private String name;
    private String introduce;
    private String downloadUrl;
    private String time;
    private Float size;
    private int downloadTimes;
    private String unit;//单位

    public Resource() {
    }

    public Resource(String name, String introduce, String downloadUrl, String time, Float size, int downloadTimes) {
        this.name = name;
        this.introduce = introduce;
        this.downloadUrl = downloadUrl;
        this.time = time;
        this.size = size;
        this.downloadTimes = downloadTimes;
    }

    @Override
    public String toString() {
        return "Resource{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", introduce='" + introduce + '\'' +
                ", downloadUrl='" + downloadUrl + '\'' +
                ", time='" + time + '\'' +
                ", size=" + size +
                ", downloadTimes=" + downloadTimes +
                '}';
    }

    @GeneratedValue
    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "introduce")
    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    @Column(name = "downloadUrl")
    public String getDownloadUrl() {
        return downloadUrl;
    }

    public void setDownloadUrl(String downloadUrl) {
        this.downloadUrl = downloadUrl;
    }

    @Column(name = "time")
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Column(name = "size")
    public Float getSize() {
        return size;
    }

    public void setSize(Float size) {
        this.size = size;
    }

    @Column(name = "downloadTimes")
    public int getDownloadTimes() {
        return downloadTimes;
    }

    public void setDownloadTimes(int downloadTimes) {
        this.downloadTimes = downloadTimes;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }
}
