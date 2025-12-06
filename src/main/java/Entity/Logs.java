package Entity;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "Logs")
public class Logs implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "Url", length = 255, nullable = false)
    private String url;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "Time", nullable = false)
    private Date time;

    @Column(name = "Username", length = 20)
    private String username;

    // Constructors
    public Logs() {
        this.time = new Date();
    }

    public Logs(String url, String username) {
        this.url = url;
        this.username = username;
        this.time = new Date();
    }

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getUrl() { return url; }
    public void setUrl(String url) { this.url = url; }

    public Date getTime() { return time; }
    public void setTime(Date time) { this.time = time; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
}