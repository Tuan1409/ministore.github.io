/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kienb
 */
public class Category {
    private int id;
    private String name;
    private List<Product> listPro = new ArrayList<>();

    public Category(int id, String name) {
        this.id = id;
        this.name = name;
    }

    
    public Category() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Product> getListPro() {
        return listPro;
    }

    public void setListPro(List<Product> listPro) {
        this.listPro = listPro;
    }
    
    
}
