package com.example.r2dbc;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table("demo")
public class DemoEntity {
    @Id
    public Long id;
    public Long catalogId;
    public String code;
    public String refCatalogIds;
    public String category;

    public DemoEntity() {
    }
}