package model;

import java.io.Serializable;

public class Supplier implements Serializable {
    private String id;
    private String name;
    private String contact;
    private String email;
    private String type;

    public Supplier(String id, String name, String contact, String email, String type) {
        this.id = id;
        this.name = name;
        this.contact = contact;
        this.email = email;
        this.type = type;
    }

    public String getId() { return id; }
    public String getName() { return name; }
    public String getContact() { return contact; }
    public String getEmail() { return email; }
    public String getType() { return type; }

    public void setId(String id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setContact(String contact) { this.contact = contact; }
    public void setEmail(String email) { this.email = email; }
    public void setType(String type) { this.type = type; }
}
