/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Chapter;
import entity.Genre;
import entity.Manga;
import entity.Users;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author X1 carbon
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Manga> getAllManga() {
        List<Manga> list = new ArrayList<>();
        String query = "select * from Manga";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Manga(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Genre> getAllGenre() {
        List<Genre> list = new ArrayList<>();
        String query = "SELECT * FROM Genre ORDER BY genreId;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Genre(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public void insertManga(int mangaId, String title, String synopsis, String coverImageUrl, String releaseDate, String status, String author, String artist, String link) {
        String query = "INSERT INTO Manga (mangaId, title, synopsis, coverImageUrl, releaseDate, status, author, artist, link) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, mangaId);
            ps.setString(2, title);
            ps.setString(3, synopsis);
            ps.setString(4, coverImageUrl);
            ps.setString(5, releaseDate);
            ps.setString(6, status);
            ps.setString(7, author);
            ps.setString(8, artist);
            ps.setString(9, link);
            ps.executeUpdate();

        } catch (Exception e) {

        }

    }

    public void updateManga(int mangaId, String title, String synopsis, String coverImageUrl, String releaseDate, String status, String author, String artist, String[] genreIds) {
        String mangaUpdateQuery = "UPDATE Manga SET title = ?, synopsis = ?, coverImageUrl = ?, releaseDate = ?, status = ?, author = ?, artist = ? WHERE mangaId = ?";
        String genreDeleteQuery = "DELETE FROM MangaGenre WHERE mangaId = ?";
        String genreInsertQuery = "INSERT INTO MangaGenre (mangaId, genreId) VALUES (?, ?)";
        try {
            conn = new DBContext().getConnection();
            conn.setAutoCommit(false);

            // Update manga information
            ps = conn.prepareStatement(mangaUpdateQuery);
            ps.setString(1, title);
            ps.setString(2, synopsis);
            ps.setString(3, coverImageUrl);
            ps.setString(4, releaseDate);
            ps.setString(5, status);
            ps.setString(6, author);
            ps.setString(7, artist);
            ps.setInt(8, mangaId);
            ps.executeUpdate();
            ps.close();

            // Delete existing genre associations
            ps = conn.prepareStatement(genreDeleteQuery);
            ps.setInt(1, mangaId);
            ps.executeUpdate();
            ps.close();

            // Insert new genre associations if genreIds is not null or empty
            if (genreIds != null && genreIds.length > 0) {
                ps = conn.prepareStatement(genreInsertQuery);
                for (String genreId : genreIds) {
                    ps.setInt(1, mangaId);
                    ps.setInt(2, Integer.parseInt(genreId));
                    ps.addBatch();
                }
                ps.executeBatch();
                ps.close();
            }

            conn.commit();
        } catch (Exception e) {

        }
    }

    public void insertMangaGenre(int mangaId, String[] genreIds) {
        String query = "INSERT INTO MangaGenre (mangaId, genreId) VALUES (?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            for (String genreId : genreIds) {
                ps.setInt(1, mangaId);
                ps.setInt(2, Integer.parseInt(genreId));
                ps.executeUpdate();
            }
            ps.close();
        } catch (Exception e) {

        }
    }

    public List<Manga> getMangaByGenreId(String genreId) {
        List<Manga> list = new ArrayList<>();
        String query = "SELECT MG.mangaId, M.title, M.synopsis, M.coverImageUrl, M.releaseDate, M.status, M.author, M.artist, M.link "
                + "FROM MangaGenre MG "
                + "JOIN Manga M ON MG.mangaId = M.mangaId "
                + "WHERE MG.genreId = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, genreId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Manga(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public Manga getMangaByMangaId(String mangaId) {
        String query = """
                       \tselect * from Manga
                       \twhere mangaId = ?""";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, mangaId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    return new Manga(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                            rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
                }
            }
        } catch (Exception e) {

        }
        return null;
    }

    public List<Manga> getMangaByName(String txtSearch) {
        List<Manga> list = new ArrayList<>();
        String query = "select * from manga\n"
                + "where [title] like ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%"); // Set the genreId parameter
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Manga(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public Users login(String user, String pass) {
        String query = "select * from Users\n"
                + "where [user] = ?\n"
                + "and pass = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
            }
        } catch (Exception e) {

        }

        return null;
    }

    public Users checkAccountExist(String user) {
        String query = "select * from Users\n"
                + "where [user] = ?\n";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
            }
        } catch (Exception e) {

        }

        return null;
    }

    public void signUp(String user, String pass) {
        String query = "insert into Users \n"
                + "values(?,?,1,0)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void deleteManga(String mangaId) {
        String deleteMangaGenreQuery = "DELETE FROM MangaGenre WHERE mangaId = ?";
        String deleteMangaQuery = "DELETE FROM Manga WHERE mangaId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(deleteMangaGenreQuery);
            ps.setString(1, mangaId);
            ps.executeUpdate();
            ps = conn.prepareStatement(deleteMangaQuery);
            ps.setString(1, mangaId);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    public List<Chapter> getChapterByMangaId(String mangaId) {
        List<Chapter> list = new ArrayList<>();
        String query = "select * from Chapters where mangaId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, mangaId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Chapter(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5)));
            }
        } catch (Exception e) {

        }
        return list;
    }
    
    public void addToFavorites(int userId, int mangaId) {
        
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        String testMangaId = "1";
        List<Chapter> chapters = dao.getChapterByMangaId(testMangaId);
        if (chapters.isEmpty()) {
            System.out.println("No chapters found");
        } else {
            for (Chapter chapter : chapters) {
                System.out.println(chapter);
            }
        }
    }

}
