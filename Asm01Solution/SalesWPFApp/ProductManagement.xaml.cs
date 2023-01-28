using BusinessObject.Models;
using DataAccess.Repository;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SalesWPFApp
{
    /// <summary>
    /// Interaction logic for ProductManagement.xaml
    /// </summary>
    public partial class ProductManagement : Window
    {
        private readonly IOrderRepository orderRepository;
        private readonly IMemberRepository memberRepository;
        private readonly IProductRepository productRepository;
        public ProductManagement(IOrderRepository _orderRepository, IMemberRepository _memberRepository, IProductRepository _productRepository)
        {
            InitializeComponent();
            orderRepository = _orderRepository;
            memberRepository = _memberRepository;
            productRepository = _productRepository;
        }
        private Product getProductObject()
        {
            Product product = null;
            try
            {
                product = new Product
                {
                    ProductId = String.IsNullOrEmpty(txtProductId.Text) ? 0 : int.Parse(txtProductId.Text),
                    ProductName = txtProductName.Text,
                    CategoryId = int.Parse(txtCategoryId.Text),
                    Weight = txtWeight.Text,
                    UnitPrice = decimal.Parse(txtUnitPrice.Text),
                    UnitsInStock = int.Parse(txtUnitStock.Text)

                };

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Get product");
            }
            return product;
        }

        private void loadProductList()
        {
            lvProducts.ItemsSource = productRepository.getProductList();
        }

        private void btnLoad_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                loadProductList();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Load product list");
            }
        }
        private void btnInsert_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Product product = getProductObject();
                product.ProductId = 0;
                productRepository.addNew(product);
                loadProductList();
                MessageBox.Show($"{product.ProductName} inserted succesfully", "Insert Product");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Insert product");
            }
        }
        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Product product = getProductObject();
                productRepository.Update(product);
                loadProductList();
                MessageBox.Show($"{product.ProductName} update succesfully", "Update Product");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Update product");
            }
        }
        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Product product = getProductObject();
                productRepository.Remove(product);
                loadProductList();
                MessageBox.Show($"{product.ProductName} delete succesfully", "Delete Product");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Delete product");
            }
        }

       
        private void btnSearchByID_Click(object sender,RoutedEventArgs e)
        {
            try
            {
                if (String.IsNullOrEmpty(txtProductId.Text))
                {
                    MessageBox.Show("Please fill id before search by id");
                }
                else
                {
                    List<Product> products = new List<Product>();
                    products.Add(productRepository.getProductByID(int.Parse(txtProductId.Text)));
                    lvProducts.ItemsSource = products;
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "Search product by id");
            }
            
        }

        private void btnSearchByPrice_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (String.IsNullOrEmpty(txtUnitPrice.Text))
                {
                    MessageBox.Show("Please fill Price before search by price");
                }
                else
                {
                
                    lvProducts.ItemsSource = productRepository.getProductByPrice(int.Parse(txtUnitPrice.Text));
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Search product by id");
            }
        }

        private void btnSearchByStock_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (String.IsNullOrEmpty(txtUnitStock.Text))
                {
                    MessageBox.Show("Please fill Stock before search by stock");
                }
                else
                {

                    lvProducts.ItemsSource = productRepository.getProductByStock(int.Parse(txtUnitStock.Text));
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Search product by id");
            }
        }

        private void btnMember_Click(object sender, RoutedEventArgs e)
        {
            this.Hide();
            MemberManagement member = new MemberManagement(orderRepository, memberRepository, productRepository);
            member.Show();
        }

        private void btnProduct_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void btnOrder_Click(object sender, RoutedEventArgs e)
        {
            this.Hide();
            OrderManagement order = new OrderManagement(orderRepository,memberRepository,productRepository);
            order.Show();
        }
      
        private void btnLogout_Click(object sender, RoutedEventArgs e)
        {
            this.Hide();
            Login login = new Login(productRepository,memberRepository,orderRepository);
            login.Show();

        }
    }
}
