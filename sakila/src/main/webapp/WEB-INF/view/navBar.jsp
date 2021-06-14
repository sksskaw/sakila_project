<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item nav-profile">
              <a href="#" class="nav-link">
                <div class="profile-image">
                  <img class="img-xs rounded-circle" src="${pageContext.request.contextPath}/template/src/assets/images/faces/face8.jpg" alt="profile image">
                  <div class="dot-indicator bg-success"></div>
                </div>
                <div class="text-wrapper">
                  <p class="profile-name">${loginStaff.firstName} ${loginStaff.lastName}</p>
                  <p class="designation">${loginStaff.email}</p>
                </div>
              </a>
            </li>
            <li class="nav-item nav-category">Main Menu</li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/admin/getSalesList">
                <i class="menu-icon typcn typcn-document-text"></i>
                <span class="menu-title">Dashboard</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <i class="menu-icon typcn typcn-coffee"></i>
                <span class="menu-title">Rental</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/getRentalList">Rental List</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/addRental">Rental</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/addReturn">Return</a>
                  </li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/admin/getStaffList">
                <i class="menu-icon typcn typcn-shopping-bag"></i>
                <span class="menu-title">Staff</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/admin/getBoardList">
                <i class="menu-icon typcn typcn-th-large-outline"></i>
                <span class="menu-title">Board</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/admin/getFilmList">
                <i class="menu-icon typcn typcn-bell"></i>
                <span class="menu-title">Film</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/admin/getActorList">
                <i class="menu-icon typcn typcn-user-outline"></i>
                <span class="menu-title">Actor</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/admin/getCustomerList">
                <i class="menu-icon typcn typcn-user-outline"></i>
                <span class="menu-title">Customer</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/admin/getInventoryList">
                <i class="menu-icon typcn typcn-user-outline"></i>
                <span class="menu-title">Inventory</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/admin/logout">
                <i class="menu-icon typcn typcn-user-outline"></i>
                <span class="menu-title">Logout</span>
              </a>
            </li>
            

          </ul>
        </nav>