using SignInApi.Models;

namespace SignInApi.Services
{
    public interface IJwtService
    {
        string GenerateToken(User user);
        int? GetUserIdFromToken(string token);
    }
} 