/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author X1 carbon
 */
public class Oneshot {
    private int id;
    private String title;
    private String link;
    private String image;

    public Oneshot() {
    }

    public Oneshot(int id, String title, String link, String image) {
        this.id = id;
        this.title = title;
        this.link = link;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Oneshot{" + "id=" + id + ", title=" + title + ", link=" + link + ", image=" + image + '}';
    }
    
    
}
