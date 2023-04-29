# Getting Started with DAPPs

Here is an example code for a simple UI using next.js 13 for user login using userop.js and ERC-4337:

```javascript
// pages/_app.js
// Import NextUIProvider and createTheme from userop.js
import { NextUIProvider, createTheme } from "@nextui-org/react";

// Create a custom theme object
const theme = createTheme({
  type: "dark",
  theme: {
    colors: {
      primary: "#4ADE7B",
      secondary: "#F9CB80",
      error: "#FCC5D8",
    },
  },
});

// Wrap the app component with NextUIProvider and pass the theme object
function MyApp({ Component, pageProps }) {
  return (
    <NextUIProvider theme={theme}>
      <Component {...pageProps} />
    </NextUIProvider>
  );
}

export default MyApp;

// app/login/page.js
// Import userop.js and ethers.js
const { Client, Presets } = require("userop");
const { ethers } = require("ethers");

// Import some UI components from userop.js
import { Button, Input, Text } from "@nextui-org/react";

// Define some constants
const rpcUrl = "https://mainnet.infura.io/v3/<YOUR-PROJECT-ID>";
const entryPoint = "0x0000000000000000000000000000000000000000"; // The entry point address for ERC-4337
const simpleAccountFactory = "0x0000000000000000000000000000000000000000"; // The address of the SimpleAccount factory contract
const dappAddress = "0x1234567890123456789012345678901234567890"; // The address of the dapp contract that requires login
const loginFunction = "login(address)"; // The name of the login function in the dapp contract

// Create a provider and a signer using ethers.js
const provider = new ethers.providers.JsonRpcProvider(rpcUrl);
const signer = new ethers.Wallet(signingKey);

// Create a smart account builder using the SimpleAccount preset
const simpleAccount = await Presets.Builder.SimpleAccount.init(
  signer,
  provider,
  entryPoint,
  simpleAccountFactory
);

// Create a client to connect to a bundler service
const client = await Client.init(provider, entryPoint);

// Create a login component that takes an email and password as inputs and calls the login function of the dapp contract with the user's address as an argument
export default function Login() {
  // Use React hooks to store the email and password state
  const [email, setEmail] = React.useState("");
  const [password, setPassword] = React.useState("");

  // Use React hooks to store the loading and error state
  const [loading, setLoading] = React.useState(false);
  const [error, setError] = React.useState(null);

  // Define a function that handles the login logic
  const handleLogin = async () => {
    // Reset the error state
    setError(null);

    // Validate the email and password inputs
    if (!email || !password) {
      setError("Please enter your email and password.");
      return;
    }

    // Set the loading state to true
    setLoading(true);

    try {
      // Create and send a UserOperation that calls the login function of the dapp contract with the user's address as an argument
      const res = await client.sendUserOperation(
        simpleAccount.execute(dappAddress, 0, ethers.utils.id(loginFunction), [
          signer.address,
        ])
      );

      console.log(`UserOpHash: ${res.userOpHash}`);

      console.log("Waiting for transaction...");
      const ev = await res.wait();
      console.log(`Transaction hash: ${ev?.transactionHash ?? null}`);

      // If successful, redirect to the home page or show a success message
      alert("Login successful!");
    } catch (err) {
      // If failed, show an error message
      setError(err.message);
    }

    // Set the loading state to false
    setLoading(false);
  };

  return (
    <div className="container">
      <Text h1>Login</Text>
      <Input
        type="email"
        value={email}
        onChange={(e) => setEmail(e.target.value)}
        placeholder="Email"
        size="large"
        fullWidth
        required
      />
      <Input.Password
        value={password}
        onChange={(e) => setPassword(e.target.value)}
        placeholder="Password"
        size="large"
        fullWidth
        required
      />
      <Button
        type="primary"
        onClick={handleLogin}
        loading={loading}
        disabled={loading}
        size="large"
        fullWidth
      >
        Login
      </Button>
      {error && <Text color="error">{error}</Text>}
    </div>
  );
}
```