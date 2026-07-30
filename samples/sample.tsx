import { useState } from "react";

interface Props {
  amountCents: number;
  currency?: "USD" | "EUR";
}

/** A tiny checkout button — shows JSX tags, attributes, and expressions. */
export function CheckoutButton({ amountCents, currency = "USD" }: Props) {
  const [loading, setLoading] = useState(false);
  const label = `Pay $${(amountCents / 100).toFixed(2)}`;

  return (
    <button
      className="checkout-btn"
      data-currency={currency}
      disabled={loading}
      onClick={() => setLoading(true)}
    >
      {loading ? <Spinner size={16} /> : label}
    </button>
  );
}
