package com.qiu.system.utils;

import com.qiu.system.entity.BaseEntity;

import java.time.LocalDateTime;

/**
 * 实体工具类，用于公共字段赋值
 */
public class EntityUtil {

    /**
     * 为新增实体设置公共字段
     * @param entity 实体对象
     * @param userId 创建人ID
     * @param userName 创建人名称
     * @param orgId 组织ID
     */
    public static void setCreateFields(BaseEntity entity, Long userId, String userName, Long orgId) {
        entity.setGmtCreate(LocalDateTime.now());
        entity.setGmtModified(LocalDateTime.now());
        entity.setOpCreateId(userId);
        entity.setOpCreateName(userName);
        entity.setOpModifiedId(userId);
        entity.setOpModifiedName(userName);
        entity.setIsDel(0);
        entity.setTenantId(0L); // 默认租户ID
        entity.setOrgId(orgId);
    }

    /**
     * 为修改实体设置公共字段
     * @param entity 实体对象
     * @param userId 修改人ID
     * @param userName 修改人名称
     */
    public static void setUpdateFields(BaseEntity entity, Long userId, String userName) {
        entity.setGmtModified(LocalDateTime.now());
        entity.setOpModifiedId(userId);
        entity.setOpModifiedName(userName);
    }

    /**
     * 为删除实体设置公共字段（软删除）
     * @param entity 实体对象
     * @param userId 删除人ID
     * @param userName 删除人名称
     */
    public static void setDeleteFields(BaseEntity entity, Long userId, String userName) {
        entity.setGmtModified(LocalDateTime.now());
        entity.setOpModifiedId(userId);
        entity.setOpModifiedName(userName);
        entity.setIsDel(1);
    }

    /**
     * 为批量操作设置公共字段
     * @param entities 实体对象列表
     * @param userId 操作人ID
     * @param userName 操作人名称
     * @param orgId 组织ID
     * @param operationType 操作类型：create, update, delete
     */
    public static void setBatchFields(java.util.List<? extends BaseEntity> entities, Long userId, String userName, Long orgId, String operationType) {
        for (BaseEntity entity : entities) {
            switch (operationType) {
                case "create":
                    setCreateFields(entity, userId, userName, orgId);
                    break;
                case "update":
                    setUpdateFields(entity, userId, userName);
                    break;
                case "delete":
                    setDeleteFields(entity, userId, userName);
                    break;
                default:
                    break;
            }
        }
    }

}
