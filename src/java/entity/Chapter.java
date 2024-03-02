/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author X1 carbon
 */
public class Chapter {
    private int chapterId;
    private int mangaId;
    private int views;
    private String title;
    private String releaseDate;

    public Chapter(int chapterId, int mangaId, int views, String title, String releaseDate) {
        this.chapterId = chapterId;
        this.mangaId = mangaId;
        this.views = views;
        this.title = title;
        this.releaseDate = releaseDate;
    }


    public Chapter() {
    }

    public int getChapterId() {
        return chapterId;
    }

    public void setChapterId(int chapterId) {
        this.chapterId = chapterId;
    }
    
    
    public int getMangaId() {
        return mangaId;
    }

    public void setMangaId(int mangaId) {
        this.mangaId = mangaId;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    @Override
    public String toString() {
        return "Chapter{" + "mangaId=" + mangaId + ", views=" + views + ", title=" + title + ", releaseDate=" + releaseDate + '}';
    }
    
     
}
