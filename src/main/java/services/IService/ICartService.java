package services.IService;

import java.util.List;

public interface ICartService<E> {
    void add(E e);
    void add(int productId, int sizeId, int userId);
    void delete(int id);
    void edit(int id, E e);
    List<E> findCartByUserId(int userId);
    void deleteByUserId(int userId);
}
