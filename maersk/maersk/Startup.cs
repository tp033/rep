using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(maersk.Startup))]
namespace maersk
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
