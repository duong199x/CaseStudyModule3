package services.IService;

import java.util.List;

public interface IUserService<E> {
    void add(E e);
    void edit(E e);
    List<E> findAll();
    E findById(int id);
    E findByEmail(String email);
}
