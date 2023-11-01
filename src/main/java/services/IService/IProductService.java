package services.IService;

import java.util.List;

public interface IProductService<E> {
    boolean add(E e);

    boolean edit(E e, int id);

    boolean delete(int id);

    List<E> findAll();
    E findProductById(int id);
}
