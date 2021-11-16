package vn.thegioicaycanh.model.header_footer;

public class Header {
    private String name;
    private String logo;
    private String shortcut;

    public Header(String name, String logo, String shortcut) {
        this.name = name;
        this.logo = logo;
        this.shortcut = shortcut;
    }

    public Header() {
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getShortcut() {
        return shortcut;
    }

    public void setShortcut(String shorcut) {
        this.shortcut = shorcut;
    }

    @Override
    public String toString() {
        return "Header{" +
                "name='" + name + '\'' +
                ", logo='" + logo + '\'' +
                ", shortcut='" + shortcut + '\'' +
                '}';
    }
}
