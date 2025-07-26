package com.circre.be.common.constant;

public enum Knowledge {

    MATERIALS("MATERIALS", Parameters.materialKnowledgePath),
    MATERIAL_SUPPLIER("MATERIAL_SUPPLIER", Parameters.supplierKnowledgePath),
    ACTIVITY("ACTIVITY", Parameters.activityKnowledgePath);

    private final String name;
    private final String path;
    Knowledge(String name, String path) {
        this.name = name;
        this.path = path;
    }

    public String getName() {
        return name;
    }

    public String getPath() {
        return path;
    }
}
