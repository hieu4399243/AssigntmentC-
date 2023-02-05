
using DataAccess.Repository;
using Microsoft.Extensions.DependencyInjection;
using System.Windows;

namespace SalesWPFApp
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        private ServiceProvider serviceProvider;
        public App()
        {
            ServiceCollection services = new ServiceCollection();
            ConfigureServices(services);
            serviceProvider = services.BuildServiceProvider();
        }
        private void ConfigureServices(ServiceCollection services)
        {
           
            services.AddSingleton<ProductManagement>();
            services.AddSingleton<MemberManagement>();
            services.AddSingleton<OrderManagement>();
            services.AddSingleton<ProfileManagement>();
            services.AddSingleton<Login>();
            services.AddScoped<IOrderRepository, OrderRepository>();
            services.AddScoped<IProductRepository, ProductRepository>();
            services.AddScoped<IMemberRepository, MemberRepository>();

        }
        private void OnStartup(object sender, StartupEventArgs e)
        {
            var mainWindow = serviceProvider.GetService<Login>();
            mainWindow.Show();
        }

    }
}
