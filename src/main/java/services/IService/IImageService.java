package services.IService;

import java.util.List;

public interface IImageService<E> {
    boolean add(E e,int productId);

    boolean edit(E e, int productId, int id);

    boolean delete(int id);

    List<E> findAll();
    E findProductById(int id);
    List<E> findAllImageByProductId(int productId);
}
