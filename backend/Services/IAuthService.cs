using SignInApi.Models;

namespace SignInApi.Services
{
    public interface IAuthService
    {
        Task<AuthResponse?> RegisterAsync(RegisterRequest request);
        Task<AuthResponse?> LoginAsync(LoginRequest request);
        Task<UserDto?> GetUserByIdAsync(int userId);
    }
} 