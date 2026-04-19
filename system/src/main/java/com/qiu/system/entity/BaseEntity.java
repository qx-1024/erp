package com.qiu.system.entity;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * 基础实体类，包含所有公共字段
 */
@Data
public abstract class BaseEntity {

    /**
     * 组织ID
     */
    private Long orgId;

    /**
     * 创建时间
     */
    private LocalDateTime gmtCreate;

    /**
     * 修改时间
     */
    private LocalDateTime gmtModified;

    /**
     * 创建人ID
     */
    private Long opCreateId;

    /**
     * 修改人ID
     */
    private Long opModifiedId;

    /**
     * 创建人名称
     */
    private String opCreateName;

    /**
     * 修改人名称
     */
    private String opModifiedName;

    /**
     * 是否删除（0=否 1=是）
     */
    private Integer isDel;

    /**
     * 租户ID
     */
    private Long tenantId;

}
