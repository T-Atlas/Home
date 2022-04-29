package com.g65.homespring;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.sql.DataSource;
import java.sql.SQLException;

@SpringBootTest
class HomeSpringApplicationTests {

    @Autowired
    private DataSource dataSource;

    @Test
    void contextLoads() {
    }

    /**
     * HikariProxyConnection@237711398 wrapping com.mysql.cj.jdbc.ConnectionImpl@38bc5ac0
     * @throws SQLException
     */
    @Test
    void getConnection() throws SQLException {
        System.out.println(dataSource.getConnection());
    }
}
