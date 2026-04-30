package rs.ac.singidunum.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import rs.ac.singidunum.entity.Customer;
import rs.ac.singidunum.entity.Library;
import rs.ac.singidunum.repo.CustomerRepository;
import rs.ac.singidunum.repo.LibraryRepository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class LibraryService {

    private final LibraryRepository repository;
    private final CustomerRepository customerRepository;

    public List<Library> getLibrary() {
        return repository.findAllByDeletedAtIsNull();
    }

    public Optional<Library> getLibraryById(Integer id) {
        return repository.findByIdAndDeletedAtIsNull(id);
    }

    public Library createLibrary(Library model) {

        Customer customer = customerRepository.findById(model.getCustomerId())
                .orElseThrow(() -> new RuntimeException("Customer nije pronađen"));

        Library library = new Library();
        library.setCustomer(customer);
        library.setGameSlug(model.getGameSlug());
        library.setGameName(model.getGameName());
        library.setBgImg(model.getBgImg());
        library.setUserRating(model.getUserRating());
        library.setStatus(model.getStatus());
        library.setNotes(model.getNotes());
        library.setCreatedAt(LocalDateTime.now());

        return repository.save(library);
    }

    public Library updateLibrary(Integer id, Library model) {
        Library library = getLibraryById(id).orElseThrow();

        library.setGameSlug(model.getGameSlug());
        library.setGameName(model.getGameName());
        library.setBgImg(model.getBgImg());
        library.setUserRating(model.getUserRating());
        library.setStatus(model.getStatus());
        library.setNotes(model.getNotes());
        library.setUpdatedAt(LocalDateTime.now());

        return repository.save(library);
    }

    public void deleteLibrary(Integer id) {
        Library library = getLibraryById(id).orElseThrow();
        library.setDeletedAt(LocalDateTime.now());
        repository.save(library);
    }
}