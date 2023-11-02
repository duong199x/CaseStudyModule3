package services.IService;

import java.util.List;

public interface ISizeService<E> {
    boolean add(E e,int productId);

    boolean edit(E e, int id);

    boolean delete(int id);

    List<E> findAll();
    E findProductById(int id);
    List<E> findAllSizeByProductId(int productId);

}
