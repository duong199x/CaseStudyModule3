package services.IService;

import model.Order;

import java.util.List;

public interface IOrderService<E> {
    int add (E e);
    void edit (E e);
    void changeStatus(int id, int status);
    void delete (int id);
    List<E> getAll();
    List<E> findByUser(int id);
    E findById(int id);
}
