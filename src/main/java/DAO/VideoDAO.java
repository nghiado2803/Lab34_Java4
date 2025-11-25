package DAO;

import Entity.Video;
import java.util.List;

public interface VideoDAO extends GenericDAO<Video, String> {
    List<Video> searchByTitle(String keyword);
}