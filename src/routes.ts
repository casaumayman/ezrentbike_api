import { register, login, editUser, changePassword } from "./controller/authController";
import { listUser, deleteUser, editUser as edit } from "./controller/userController";
import { listProducer, addLease, getListLease } from "./controller/servicesController";
import { addProduct, listProduct, deleteProduct, editProduct, getProduct } from "./controller/productController";
import { addFeedback, listFeedback } from "./controller/feedbackController";

export const appRoutes = [
    {
        path: '/api/register',
        method: 'post',
        action: register
    },
    {
        path: '/api/login',
        method: 'post',
        action: login
    },
    {
        path: '/api/user/edit',
        method: 'post',
        action: editUser
    },
    {
        path: '/api/user/change-password',
        method: 'post',
        action: changePassword
    },
    {
        path: '/api/user',
        method: 'post',
        action: listUser
    },
    {
        path: '/api/user/delete',
        method: 'post',
        action: deleteUser
    },
    {
        path: '/api/user/edit-user',
        method: 'post',
        action: edit
    },
    {
        path: '/api/service/list-producer',
        method: 'get',
        action: listProducer
    },
    {
        path: '/api/product/add-product',
        method: 'post',
        action: addProduct
    },
    {
        path: '/api/product',
        method: 'get',
        action: listProduct
    },
    {
        path: '/api/product/delete',
        method: 'post',
        action: deleteProduct
    },
    {
        path: '/api/product/edit',
        method: 'post',
        action: editProduct
    },
    {
        path: '/api/product/detail',
        method: 'post',
        action: getProduct
    },
    {
        path: '/api/feedback/add-feedback',
        method: 'post',
        action: addFeedback
    },
    {
        path: '/api/feedback',
        method: 'post',
        action: listFeedback
    },
    {
        path: '/api/lease',
        method: 'post',
        action: addLease
    },
    {
        path: '/api/get-list-lease',
        method: 'post',
        action: getListLease
    },
]