/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author X1 carbon
 */
public class Manga {
    private int mangaId;
    private String title;
    private String synopsis;
    private String coverImageUrl;
    private String releaseDate;
    private String status;
    private String author;
    private String artist;
    private String link;

    public Manga() {
    }

    public Manga(int mangaId, String title, String coverImageUrl) {
        this.mangaId = mangaId;
        this.title = title;
        this.coverImageUrl = coverImageUrl;
    }

    public Manga(int mangaId, String title, String synopsis, String coverImageUrl, String releaseDate, String status, String author, String artist, String link) {
        this.mangaId = mangaId;
        this.title = title;
        this.synopsis = synopsis;
        this.coverImageUrl = coverImageUrl;
        this.releaseDate = releaseDate;
        this.status = status;
        this.author = author;
        this.artist = artist;
        this.link = link;
    }

    public int getMangaId() {
        return mangaId;
    }

    public void setMangaId(int mangaId) {
        this.mangaId = mangaId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSynopsis() {
        return synopsis;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }

    public String getCoverImageUrl() {
        return coverImageUrl;
    }

    public void setCoverImageUrl(String coverImageUrl) {
        this.coverImageUrl = coverImageUrl;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Override
    public String toString() {
        return "Manga{" + "mangaId=" + mangaId + ", title=" + title + ", synopsis=" + synopsis + ", coverImageUrl=" + coverImageUrl + ", releaseDate=" + releaseDate + ", status=" + status + ", author=" + author + ", artist=" + artist + ", link=" + link + '}';
    }
   
    
    
    
    
}
