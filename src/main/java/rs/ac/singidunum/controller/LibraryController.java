package rs.ac.singidunum.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import rs.ac.singidunum.entity.Library;
import rs.ac.singidunum.service.LibraryService;

import java.util.List;

@RestController
@RequestMapping(path = "/api/library")
@CrossOrigin
@RequiredArgsConstructor
public class LibraryController {

    private final LibraryService service;

    @GetMapping
    public List<Library> getLibrary() {
        return service.getLibrary();
    }

    @GetMapping(path = "/{id}")
    public ResponseEntity<Library> getLibraryById(@PathVariable Integer id) {
        return ResponseEntity.of(service.getLibraryById(id));
    }

    @PostMapping
    public Library saveLibrary(@RequestBody Library model) {
        return service.createLibrary(model);
    }

    @PutMapping(path = "/{id}")
    public Library updateLibrary(@PathVariable Integer id, @RequestBody Library model) {
        return service.updateLibrary(id, model);
    }

    @DeleteMapping(path = "/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteLibrary(@PathVariable Integer id) {
        service.deleteLibrary(id);
    }
}