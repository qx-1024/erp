-- 基础数据模块
-- 商品分类表
CREATE TABLE IF NOT EXISTS product_category (
    id BIGINT PRIMARY KEY COMMENT '分类ID',
    category_code VARCHAR(50) NOT NULL COMMENT '分类编码',
    category_name VARCHAR(100) NOT NULL COMMENT '分类名称',
    parent_id BIGINT NULL COMMENT '父分类ID',
    level INT NOT NULL DEFAULT 1 COMMENT '分类级别',
    sort_order INT DEFAULT 0 COMMENT '排序序号',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态（1:启用，0:禁用）',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基础数据-商品分类表';

-- 计量单位表
CREATE TABLE IF NOT EXISTS unit (
    id BIGINT PRIMARY KEY COMMENT '单位ID',
    unit_code VARCHAR(50) NOT NULL COMMENT '单位编码',
    unit_name VARCHAR(50) NOT NULL COMMENT '单位名称',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态（1:启用，0:禁用）',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基础数据-计量单位表';

-- 商品表
CREATE TABLE IF NOT EXISTS product (
    id BIGINT PRIMARY KEY COMMENT '商品ID',
    product_code VARCHAR(50) NOT NULL COMMENT '商品编码',
    product_name VARCHAR(100) NOT NULL COMMENT '商品名称',
    category_id BIGINT NOT NULL COMMENT '分类ID',
    unit_id BIGINT NOT NULL COMMENT '单位ID',
    cost_price DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '成本价格',
    sale_price DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '销售价格',
    min_stock INT DEFAULT 0 COMMENT '最小库存预警值',
    max_stock INT DEFAULT 0 COMMENT '最大库存上限值',
    barcode VARCHAR(200) COMMENT '商品条码',
    description TEXT COMMENT '商品描述',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态（1:启用，0:禁用）',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基础数据-商品表';

-- 供应商表
CREATE TABLE IF NOT EXISTS supplier (
    id BIGINT PRIMARY KEY COMMENT '供应商ID',
    supplier_code VARCHAR(50) NOT NULL COMMENT '供应商编码',
    supplier_name VARCHAR(100) NOT NULL COMMENT '供应商名称',
    contact_person VARCHAR(50) COMMENT '联系人',
    phone VARCHAR(20) COMMENT '联系电话',
    address VARCHAR(200) COMMENT '联系地址',
    bank_account VARCHAR(100) COMMENT '银行账号',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态（1:启用，0:禁用）',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基础数据-供应商表';

-- 客户表
CREATE TABLE IF NOT EXISTS customer (
    id BIGINT PRIMARY KEY COMMENT '客户ID',
    customer_code VARCHAR(50) NOT NULL COMMENT '客户编码',
    customer_name VARCHAR(100) NOT NULL COMMENT '客户名称',
    contact_person VARCHAR(50) COMMENT '联系人',
    phone VARCHAR(20) COMMENT '联系电话',
    address VARCHAR(200) COMMENT '联系地址',
    credit_limit DECIMAL(10,2) DEFAULT 0.00 COMMENT '信用额度',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态（1:启用，0:禁用）',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基础数据-客户表';

-- 仓库表
CREATE TABLE IF NOT EXISTS warehouse (
    id BIGINT PRIMARY KEY COMMENT '仓库ID',
    warehouse_code VARCHAR(50) NOT NULL COMMENT '仓库编码',
    warehouse_name VARCHAR(100) NOT NULL COMMENT '仓库名称',
    address VARCHAR(200) COMMENT '仓库地址',
    manager VARCHAR(50) COMMENT '负责人',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态（1:启用，0:禁用）',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基础数据-仓库表';

-- 采购管理模块
-- 采购申请表
CREATE TABLE IF NOT EXISTS purchase_application (
    id BIGINT PRIMARY KEY COMMENT '申请表ID',
    application_code VARCHAR(50) NOT NULL COMMENT '申请单编码',
    apply_date DATE NOT NULL COMMENT '申请日期',
    applicant VARCHAR(50) NOT NULL COMMENT '申请人',
    department VARCHAR(50) NOT NULL COMMENT '申请部门',
    status VARCHAR(20) NOT NULL DEFAULT '待审批' COMMENT '审批状态',
    total_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '总金额',
    remark TEXT COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='采购管理-采购申请表';

-- 采购申请明细表
CREATE TABLE IF NOT EXISTS purchase_application_detail (
    id BIGINT PRIMARY KEY COMMENT '明细ID',
    application_id BIGINT NOT NULL COMMENT '采购申请单ID',
    product_id BIGINT NOT NULL COMMENT '商品ID',
    product_code VARCHAR(50) NOT NULL COMMENT '商品编码',
    product_name VARCHAR(100) NOT NULL COMMENT '商品名称',
    unit_id BIGINT NOT NULL COMMENT '单位ID',
    apply_quantity INT NOT NULL COMMENT '申请数量',
    estimated_price DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '预估单价',
    amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '明细金额',
    remark VARCHAR(200) COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='采购管理-采购申请明细表';

-- 采购订单表
CREATE TABLE IF NOT EXISTS purchase_order (
    id BIGINT PRIMARY KEY COMMENT '订单ID',
    order_code VARCHAR(50) NOT NULL COMMENT '订单编码',
    supplier_id BIGINT NOT NULL COMMENT '供应商ID',
    order_date DATE NOT NULL COMMENT '下单日期',
    expected_delivery_date DATE COMMENT '预计交货日期',
    logistics_company VARCHAR(50) COMMENT '物流公司',
    logistics_no VARCHAR(100) COMMENT '物流单号',
    logistics_status VARCHAR(50) COMMENT '物流状态',
    status VARCHAR(20) NOT NULL DEFAULT '待审核' COMMENT '订单状态',
    total_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '订单总金额',
    remark TEXT COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='采购管理-采购订单表';

-- 采购订单明细表
CREATE TABLE IF NOT EXISTS purchase_order_detail (
    id BIGINT PRIMARY KEY COMMENT '明细ID',
    order_id BIGINT NOT NULL COMMENT '采购订单ID',
    product_id BIGINT NOT NULL COMMENT '商品ID',
    product_code VARCHAR(50) NOT NULL COMMENT '商品编码',
    product_name VARCHAR(100) NOT NULL COMMENT '商品名称',
    unit_id BIGINT NOT NULL COMMENT '单位ID',
    quantity INT NOT NULL COMMENT '采购数量',
    unit_price DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '采购单价',
    amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '明细金额',
    remark VARCHAR(200) COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='采购管理-采购订单明细表';

-- 采购入库单表
CREATE TABLE IF NOT EXISTS purchase_receipt (
    id BIGINT PRIMARY KEY COMMENT '入库单ID',
    receipt_code VARCHAR(50) NOT NULL COMMENT '入库单编码',
    order_id BIGINT NOT NULL COMMENT '采购订单ID',
    supplier_id BIGINT NOT NULL COMMENT '供应商ID',
    warehouse_id BIGINT NOT NULL COMMENT '仓库ID',
    receipt_date DATE NOT NULL COMMENT '入库日期',
    status VARCHAR(20) NOT NULL DEFAULT '待审核' COMMENT '入库单状态',
    total_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '入库总金额',
    remark TEXT COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='采购管理-采购入库单表';

-- 采购入库单明细表
CREATE TABLE IF NOT EXISTS purchase_receipt_detail (
    id BIGINT PRIMARY KEY COMMENT '明细ID',
    receipt_id BIGINT NOT NULL COMMENT '采购入库单ID',
    order_detail_id BIGINT NOT NULL COMMENT '采购订单明细ID',
    product_id BIGINT NOT NULL COMMENT '商品ID',
    product_code VARCHAR(50) NOT NULL COMMENT '商品编码',
    product_name VARCHAR(100) NOT NULL COMMENT '商品名称',
    unit_id BIGINT NOT NULL COMMENT '单位ID',
    quantity INT NOT NULL COMMENT '入库数量',
    unit_price DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '入库单价',
    amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '明细金额',
    remark VARCHAR(200) COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='采购管理-采购入库单明细表';

-- 采购付款记录表
CREATE TABLE IF NOT EXISTS purchase_payment_record (
    id BIGINT PRIMARY KEY COMMENT '付款记录ID',
    payment_code VARCHAR(50) NOT NULL COMMENT '付款单号',
    order_id BIGINT NOT NULL COMMENT '采购订单ID',
    supplier_id BIGINT NOT NULL COMMENT '供应商ID',
    payment_date DATE NOT NULL COMMENT '付款日期',
    payment_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '付款金额',
    payment_method VARCHAR(50) NOT NULL COMMENT '付款方式',
    status VARCHAR(20) NOT NULL DEFAULT '待审批' COMMENT '付款状态',
    remark TEXT COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='采购管理-采购付款记录表';

-- 销售管理模块
-- 销售订单表
CREATE TABLE IF NOT EXISTS sales_order (
    id BIGINT PRIMARY KEY COMMENT '订单ID',
    order_code VARCHAR(50) NOT NULL COMMENT '订单编码',
    customer_id BIGINT NOT NULL COMMENT '客户ID',
    order_date DATE NOT NULL COMMENT '下单日期',
    expected_delivery_date DATE COMMENT '预计交货日期',
    logistics_company VARCHAR(50) COMMENT '物流公司',
    logistics_no VARCHAR(100) COMMENT '物流单号',
    logistics_status VARCHAR(50) COMMENT '物流状态',
    status VARCHAR(20) NOT NULL DEFAULT '待审核' COMMENT '订单状态',
    total_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '订单总金额',
    remark TEXT COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='销售管理-销售订单表';

-- 销售订单明细表
CREATE TABLE IF NOT EXISTS sales_order_detail (
    id BIGINT PRIMARY KEY COMMENT '明细ID',
    order_id BIGINT NOT NULL COMMENT '销售订单ID',
    product_id BIGINT NOT NULL COMMENT '商品ID',
    product_code VARCHAR(50) NOT NULL COMMENT '商品编码',
    product_name VARCHAR(100) NOT NULL COMMENT '商品名称',
    unit_id BIGINT NOT NULL COMMENT '单位ID',
    quantity INT NOT NULL COMMENT '销售数量',
    unit_price DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '销售单价',
    amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '明细金额',
    remark VARCHAR(200) COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='销售管理-销售订单明细表';

-- 销售出库单表
CREATE TABLE IF NOT EXISTS sales_shipment (
    id BIGINT PRIMARY KEY COMMENT '出库单ID',
    shipment_code VARCHAR(50) NOT NULL COMMENT '出库单编码',
    order_id BIGINT NOT NULL COMMENT '销售订单ID',
    customer_id BIGINT NOT NULL COMMENT '客户ID',
    warehouse_id BIGINT NOT NULL COMMENT '仓库ID',
    shipment_date DATE NOT NULL COMMENT '出库日期',
    status VARCHAR(20) NOT NULL DEFAULT '待审核' COMMENT '出库单状态',
    total_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '出库总金额',
    remark TEXT COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='销售管理-销售出库单表';

-- 销售出库单明细表
CREATE TABLE IF NOT EXISTS sales_shipment_detail (
    id BIGINT PRIMARY KEY COMMENT '明细ID',
    shipment_id BIGINT NOT NULL COMMENT '销售出库单ID',
    order_detail_id BIGINT NOT NULL COMMENT '销售订单明细ID',
    product_id BIGINT NOT NULL COMMENT '商品ID',
    product_code VARCHAR(50) NOT NULL COMMENT '商品编码',
    product_name VARCHAR(100) NOT NULL COMMENT '商品名称',
    unit_id BIGINT NOT NULL COMMENT '单位ID',
    quantity INT NOT NULL COMMENT '出库数量',
    unit_price DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '出库单价',
    amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '明细金额',
    remark VARCHAR(200) COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='销售管理-销售出库单明细表';

-- 销售收款记录表
CREATE TABLE IF NOT EXISTS sales_payment_record (
    id BIGINT PRIMARY KEY COMMENT '收款记录ID',
    payment_code VARCHAR(50) NOT NULL COMMENT '收款单号',
    order_id BIGINT NOT NULL COMMENT '销售订单ID',
    customer_id BIGINT NOT NULL COMMENT '客户ID',
    payment_date DATE NOT NULL COMMENT '收款日期',
    payment_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '收款金额',
    payment_method VARCHAR(50) NOT NULL COMMENT '收款方式',
    status VARCHAR(20) NOT NULL DEFAULT '待审批' COMMENT '收款状态',
    remark TEXT COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='销售管理-销售收款记录表';

-- 库存管理模块
-- 库存表
CREATE TABLE IF NOT EXISTS inventory (
    id BIGINT PRIMARY KEY COMMENT '库存ID',
    product_id BIGINT NOT NULL COMMENT '商品ID',
    product_code VARCHAR(50) NOT NULL COMMENT '商品编码',
    product_name VARCHAR(100) NOT NULL COMMENT '商品名称',
    warehouse_id BIGINT NOT NULL COMMENT '仓库ID',
    current_stock INT NOT NULL DEFAULT 0 COMMENT '当前总库存',
    available_stock INT NOT NULL DEFAULT 0 COMMENT '可用库存',
    cost_price DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '库存成本单价',
    stock_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '库存总金额',
    min_stock INT DEFAULT 0 COMMENT '最低库存预警',
    max_stock INT DEFAULT 0 COMMENT '最高库存上限',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='库存管理-库存表';

-- 库存流水表
CREATE TABLE IF NOT EXISTS inventory_history (
    id BIGINT PRIMARY KEY COMMENT '流水ID',
    product_id BIGINT NOT NULL COMMENT '商品ID',
    product_code VARCHAR(50) NOT NULL COMMENT '商品编码',
    product_name VARCHAR(100) NOT NULL COMMENT '商品名称',
    warehouse_id BIGINT NOT NULL COMMENT '仓库ID',
    inventory_type VARCHAR(20) NOT NULL COMMENT '库存变动类型',
    direction TINYINT NOT NULL COMMENT '变动方向（1=入库 -1=出库）',
    quantity INT NOT NULL COMMENT '变动数量',
    unit_price DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '变动单价',
    amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '变动金额',
    balance INT NOT NULL COMMENT '变动后库存结余',
    ref_id VARCHAR(50) COMMENT '关联单据ID',
    ref_type VARCHAR(20) COMMENT '关联单据类型',
    operator VARCHAR(50) NOT NULL COMMENT '操作人',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='库存管理-库存流水表';

-- 库存盘点表
CREATE TABLE IF NOT EXISTS inventory_check (
    id BIGINT PRIMARY KEY COMMENT '盘点单ID',
    check_code VARCHAR(50) NOT NULL COMMENT '盘点单号',
    warehouse_id BIGINT NOT NULL COMMENT '仓库ID',
    check_date DATE NOT NULL COMMENT '盘点日期',
    checker VARCHAR(50) NOT NULL COMMENT '盘点人',
    status VARCHAR(20) NOT NULL DEFAULT '待审核' COMMENT '盘点状态',
    total_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '账面总金额',
    difference_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '盈亏总金额',
    remark TEXT COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='库存管理-库存盘点表';

-- 库存盘点明细表
CREATE TABLE IF NOT EXISTS inventory_check_detail (
    id BIGINT PRIMARY KEY COMMENT '明细ID',
    check_id BIGINT NOT NULL COMMENT '盘点单ID',
    product_id BIGINT NOT NULL COMMENT '商品ID',
    product_code VARCHAR(50) NOT NULL COMMENT '商品编码',
    product_name VARCHAR(100) NOT NULL COMMENT '商品名称',
    system_quantity INT NOT NULL COMMENT '系统库存数量',
    actual_quantity INT NOT NULL COMMENT '实际盘点数量',
    difference_quantity INT NOT NULL COMMENT '盘盈盘亏数量',
    unit_price DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '成本单价',
    difference_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '盘盈盘亏金额',
    remark VARCHAR(200) COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='库存管理-库存盘点明细表';

-- 库存调拨表
CREATE TABLE IF NOT EXISTS inventory_transfer (
    id BIGINT PRIMARY KEY COMMENT '调拨单ID',
    transfer_code VARCHAR(50) NOT NULL COMMENT '调拨单号',
    from_warehouse_id BIGINT NOT NULL COMMENT '调出仓库ID',
    to_warehouse_id BIGINT NOT NULL COMMENT '调入仓库ID',
    transfer_date DATE NOT NULL COMMENT '调拨日期',
    status VARCHAR(20) NOT NULL DEFAULT '待审核' COMMENT '调拨状态',
    total_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '调拨总金额',
    remark TEXT COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='库存管理-库存调拨表';

-- 库存调拨明细表
CREATE TABLE IF NOT EXISTS inventory_transfer_detail (
    id BIGINT PRIMARY KEY COMMENT '明细ID',
    transfer_id BIGINT NOT NULL COMMENT '调拨单ID',
    product_id BIGINT NOT NULL COMMENT '商品ID',
    product_code VARCHAR(50) NOT NULL COMMENT '商品编码',
    product_name VARCHAR(100) NOT NULL COMMENT '商品名称',
    quantity INT NOT NULL COMMENT '调拨数量',
    unit_price DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '调拨单价',
    amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '调拨金额',
    remark VARCHAR(200) COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='库存管理-库存调拨明细表';

-- 财务管理模块
-- 应收账款表
CREATE TABLE IF NOT EXISTS accounts_receivable (
    id BIGINT PRIMARY KEY COMMENT '应收款ID',
    receivable_code VARCHAR(50) NOT NULL COMMENT '应收单号',
    order_id BIGINT NOT NULL COMMENT '销售订单ID',
    customer_id BIGINT NOT NULL COMMENT '客户ID',
    amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '应收总金额',
    received_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '已收金额',
    balance DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '未收余额',
    status VARCHAR(20) NOT NULL DEFAULT '待收款' COMMENT '收款状态',
    due_date DATE NOT NULL COMMENT '到期日期',
    create_date DATE NOT NULL COMMENT '创建日期',
    remark TEXT COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='财务管理-应收账款表';

-- 应付账款表
CREATE TABLE IF NOT EXISTS accounts_payable (
    id BIGINT PRIMARY KEY COMMENT '应付款ID',
    payable_code VARCHAR(50) NOT NULL COMMENT '应付单号',
    order_id BIGINT NOT NULL COMMENT '采购订单ID',
    supplier_id BIGINT NOT NULL COMMENT '供应商ID',
    amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '应付总金额',
    paid_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '已付金额',
    balance DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '未付余额',
    status VARCHAR(20) NOT NULL DEFAULT '待付款' COMMENT '付款状态',
    due_date DATE NOT NULL COMMENT '到期日期',
    create_date DATE NOT NULL COMMENT '创建日期',
    remark TEXT COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='财务管理-应付账款表';

-- 费用表
CREATE TABLE IF NOT EXISTS expense (
    id BIGINT PRIMARY KEY COMMENT '费用ID',
    expense_code VARCHAR(50) NOT NULL COMMENT '费用单号',
    expense_type VARCHAR(50) NOT NULL COMMENT '费用类型',
    amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '费用金额',
    applicant VARCHAR(50) NOT NULL COMMENT '申请人',
    department VARCHAR(50) NOT NULL COMMENT '申请部门',
    apply_date DATE NOT NULL COMMENT '申请日期',
    status VARCHAR(20) NOT NULL DEFAULT '待审批' COMMENT '审批状态',
    remark TEXT COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='财务管理-费用表';

-- 收付款记录表
CREATE TABLE IF NOT EXISTS payment_record (
    id BIGINT PRIMARY KEY COMMENT '收付款记录ID',
    payment_code VARCHAR(50) NOT NULL COMMENT '收付款单号',
    payment_type VARCHAR(20) NOT NULL COMMENT '收付款类型（收款/付款）',
    business_id BIGINT NOT NULL COMMENT '业务单据ID',
    business_type VARCHAR(20) NOT NULL COMMENT '业务单据类型',
    amount DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '收付款金额',
    payment_method VARCHAR(50) NOT NULL COMMENT '收付款方式',
    payment_date DATE NOT NULL COMMENT '收付款日期',
    status VARCHAR(20) NOT NULL DEFAULT '待审批' COMMENT '审批状态',
    remark TEXT COMMENT '备注信息',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='财务管理-收付款记录表';

-- 用户权限模块
-- 用户表
CREATE TABLE IF NOT EXISTS t_user (
    id BIGINT PRIMARY KEY COMMENT '用户ID',
    username VARCHAR(50) NOT NULL COMMENT '登录账号',
    password VARCHAR(100) NOT NULL COMMENT '登录密码',
    name VARCHAR(50) NOT NULL COMMENT '用户姓名',
    email VARCHAR(50) COMMENT '邮箱',
    phone VARCHAR(20) COMMENT '手机号码',
    language_preference VARCHAR(10) DEFAULT 'zh-CN' COMMENT '语言偏好',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态（1:启用，0:禁用）',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限管理-用户表';

-- 角色表
CREATE TABLE IF NOT EXISTS t_role (
    id BIGINT PRIMARY KEY COMMENT '角色ID',
    role_code VARCHAR(50) NOT NULL COMMENT '角色编码',
    role_name VARCHAR(50) NOT NULL COMMENT '角色名称',
    description TEXT COMMENT '角色描述',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态（1:启用，0:禁用）',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限管理-角色表';

-- 权限表
CREATE TABLE IF NOT EXISTS permission (
    id BIGINT PRIMARY KEY COMMENT '权限ID',
    permission_code VARCHAR(50) NOT NULL COMMENT '权限编码',
    permission_name VARCHAR(100) NOT NULL COMMENT '权限名称',
    parent_id BIGINT NULL COMMENT '父权限ID',
    level INT NOT NULL DEFAULT 1 COMMENT '权限级别',
    permission_type VARCHAR(20) NOT NULL COMMENT '权限类型',
    path VARCHAR(200) COMMENT '路由路径',
    component VARCHAR(200) COMMENT '前端组件',
    icon VARCHAR(50) COMMENT '菜单图标',
    sort_order INT DEFAULT 0 COMMENT '排序序号',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态（1:启用，0:禁用）',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限管理-权限表';

-- 用户角色关联表
CREATE TABLE IF NOT EXISTS t_user_role (
    id BIGINT PRIMARY KEY COMMENT '关联ID',
    user_id BIGINT NOT NULL COMMENT '用户ID',
    role_id BIGINT NOT NULL COMMENT '角色ID',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限管理-用户角色关联表';

-- 角色权限关联表
CREATE TABLE IF NOT EXISTS t_role_permission (
    id BIGINT PRIMARY KEY COMMENT '关联ID',
    role_id BIGINT NOT NULL COMMENT '角色ID',
    permission_id BIGINT NOT NULL COMMENT '权限ID',
    org_id BIGINT DEFAULT NULL COMMENT '组织ID',
    gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
    op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
    op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
    op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
    is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
    tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限管理-角色权限关联表';

-- 字典管理模块
-- 字典类型表
CREATE TABLE sys_dict_type (
  id BIGINT(20) PRIMARY KEY COMMENT '字典类型ID',
  dict_code VARCHAR(50) NOT NULL COMMENT '字典编码',
  dict_name VARCHAR(100) NOT NULL COMMENT '字典名称',
  status TINYINT(1) NOT NULL DEFAULT 1 COMMENT '状态（1:启用，0:禁用）',
  sort INT(10) DEFAULT 0 COMMENT '排序序号',
  remark VARCHAR(255) DEFAULT NULL COMMENT '备注信息',
  org_id BIGINT DEFAULT NULL COMMENT '组织ID',
  gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
  op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
  op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
  op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
  tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统管理-字典类型表';

-- 字典项表
CREATE TABLE sys_dict_item (
  id BIGINT(20) PRIMARY KEY COMMENT '字典项ID',
  dict_type_id BIGINT(20) NOT NULL COMMENT '字典类型ID',
  item_value VARCHAR(50) NOT NULL COMMENT '字典项值',
  item_name VARCHAR(100) NOT NULL COMMENT '字典项名称',
  sort INT(10) DEFAULT 0 COMMENT '排序序号',
  remark VARCHAR(255) DEFAULT NULL COMMENT '备注信息',
  org_id BIGINT DEFAULT NULL COMMENT '组织ID',
  gmt_create datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  gmt_modified datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  op_create_id bigint DEFAULT NULL COMMENT '创建人ID',
  op_modified_id bigint DEFAULT NULL COMMENT '修改人ID',
  op_create_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
  op_modified_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  is_del int DEFAULT 0 COMMENT '是否删除（0=否 1=是）',
  tenant_id bigint DEFAULT 0 COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统管理-字典项表';