package com.jooqvertxsample;

import com.jooqvertxsample.db.tables.daos.BookDao;
import com.jooqvertxsample.db.tables.pojos.Book;
import org.jooq.Configuration;
import org.jooq.SQLDialect;
import org.jooq.impl.DefaultConfiguration;

import java.sql.SQLException;
import java.util.List;

/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) throws SQLException {


        Configuration configuration = new DefaultConfiguration();
        configuration.set(SQLDialect.MYSQL);

        BookDao bookDao = new BookDao(configuration);

        bookDao.insert(new Book(1, 1, "sample", 1, 1));

        List<Book> all = bookDao.findAll();

        System.out.println(all);

//        dao.findOneById(1)
//                .doOnSuccess(res -> {
//                    res.ifPresent(author -> System.out.println(author.toJson()));
//                })
//                .subscribe();
    }
}
