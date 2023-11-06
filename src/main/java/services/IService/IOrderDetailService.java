package services.IService;

import java.util.List;

public interface IOrderDetailService<E> {
    void add (E e);
    void add (int orderId, int productId, int sizeId);
    List<E> getAll();
    List<E> findByOderId(int oderId);
}
