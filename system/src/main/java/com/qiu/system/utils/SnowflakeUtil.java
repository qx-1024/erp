package com.qiu.system.utils;

/**
 * 雪花算法工具类
 * 用于生成全局唯一的ID
 */
public class SnowflakeUtil {

    /**
     * 起始时间戳 (2020-01-01 00:00:00)
     */
    private static final long START_TIMESTAMP = 1577836800000L;

    /**
     * 机器ID位数
     */
    private static final long MACHINE_BIT = 5;

    /**
     * 数据中心ID位数
     */
    private static final long DATACENTER_BIT = 5;

    /**
     * 序列号位数
     */
    private static final long SEQUENCE_BIT = 12;

    /**
     * 机器ID最大值
     */
    private static final long MAX_MACHINE_NUM = ~(-1L << MACHINE_BIT);

    /**
     * 数据中心ID最大值
     */
    private static final long MAX_DATACENTER_NUM = ~(-1L << DATACENTER_BIT);

    /**
     * 序列号最大值
     */
    private static final long MAX_SEQUENCE = ~(-1L << SEQUENCE_BIT);

    /**
     * 数据中心ID左移位数
     */
    private static final long DATACENTER_LEFT = SEQUENCE_BIT + MACHINE_BIT;

    /**
     * 时间戳左移位数
     */
    private static final long TIMESTAMP_LEFT = DATACENTER_LEFT + DATACENTER_BIT;

    /**
     * 数据中心ID
     */
    private final long datacenterId;

    /**
     * 机器ID
     */
    private final long machineId;

    /**
     * 序列号
     */
    private long sequence = 0L;

    /**
     * 上次时间戳
     */
    private long lastTimestamp = -1L;

    /**
     * 构造函数
     * @param datacenterId 数据中心ID
     * @param machineId 机器ID
     */
    public SnowflakeUtil(long datacenterId, long machineId) {
        if (datacenterId > MAX_DATACENTER_NUM || datacenterId < 0) {
            throw new IllegalArgumentException("datacenterId can't be greater than " + MAX_DATACENTER_NUM + " or less than 0");
        }
        if (machineId > MAX_MACHINE_NUM || machineId < 0) {
            throw new IllegalArgumentException("machineId can't be greater than " + MAX_MACHINE_NUM + " or less than 0");
        }
        this.datacenterId = datacenterId;
        this.machineId = machineId;
    }

    /**
     * 生成下一个ID
     * @return 生成的ID
     */
    public synchronized long nextId() {
        long timestamp = System.currentTimeMillis();
        if (timestamp < lastTimestamp) {
            throw new RuntimeException("Clock moved backwards. Refusing to generate id");
        }
        if (timestamp == lastTimestamp) {
            sequence = (sequence + 1) & MAX_SEQUENCE;
            if (sequence == 0) {
                timestamp = getNextTimestamp(lastTimestamp);
            }
        } else {
            sequence = 0L;
        }
        lastTimestamp = timestamp;
        return ((timestamp - START_TIMESTAMP) << TIMESTAMP_LEFT) |
                (datacenterId << DATACENTER_LEFT) |
                (machineId << SEQUENCE_BIT) |
                sequence;
    }

    /**
     * 获取下一个时间戳
     * @param lastTimestamp 上次时间戳
     * @return 下一个时间戳
     */
    private long getNextTimestamp(long lastTimestamp) {
        long timestamp = System.currentTimeMillis();
        while (timestamp <= lastTimestamp) {
            timestamp = System.currentTimeMillis();
        }
        return timestamp;
    }

    /**
     * 静态实例
     */
    private static final SnowflakeUtil INSTANCE = new SnowflakeUtil(1, 1);

    /**
     * 获取单例实例
     * @return 单例实例
     */
    public static SnowflakeUtil getInstance() {
        return INSTANCE;
    }

    /**
     * 生成ID的静态方法
     * @return 生成的ID
     */
    public static long generateId() {
        return INSTANCE.nextId();
    }

}