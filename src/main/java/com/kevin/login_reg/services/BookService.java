package com.kevin.login_reg.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kevin.login_reg.models.Book;
import com.kevin.login_reg.repositories.BookRepository;

@Service
public class BookService {
	// adding the book repository as a dependency
	private final BookRepository bookRepo;

	public BookService(BookRepository bookRepo) {
		this.bookRepo = bookRepo;
	}

	// returns all theBooks
	public List<Book> getAll() {
		return bookRepo.findAll();
	}

	// creates a book
	public	Book create(Book book) {
		return bookRepo.save(book);
	}

	// retrieves a book
	public	Book findOne(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if (optionalBook.isPresent()) {
			return optionalBook.get();
		} else {
			return null;
		}
	}
	public Book update(Book book) {
		return bookRepo.save(book);
	}
	
	
	public String delete(Long id) {
		bookRepo.deleteById(id);
		return "you deleted the record with the id of: " + id;
	}

	
}
