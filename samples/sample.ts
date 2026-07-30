/**
 * Calm Night — TypeScript sample.
 * Exercises comments, strings, template literals, numbers, enums,
 * interfaces, generics, decorators, and control flow.
 */
import { Injectable, Logger } from "@nestjs/common";

/** Money is always integer cents — never floats. */
type Cents = number;

const MAX_RETRY_ATTEMPTS = 3;
const GATEWAY_TIMEOUT_MS = 8_000;
const CARD_RE = /^\d{13,19}$/;

enum ChargeStatus {
  Pending = "pending",
  Approved = "approved",
  Declined = "declined",
}

interface Charge {
  id: string;
  amount: Cents;
  currency: "USD" | "EUR" | "GBP";
  status: ChargeStatus;
  metadata?: Record<string, unknown>;
}

@Injectable()
export class BillingService {
  private readonly logger = new Logger(BillingService.name);

  // Attempt a charge, retrying on transient gateway errors.
  async charge(customerId: string, amount: Cents): Promise<Charge> {
    if (amount <= 0) {
      throw new Error(`Invalid amount: ${amount} cents`);
    }

    for (let attempt = 1; attempt <= MAX_RETRY_ATTEMPTS; attempt++) {
      try {
        const charge = await this.gateway.submit({ customerId, amount });
        this.logger.log(`Charged ${formatUsd(amount)} → ${charge.status}`);
        return charge;
      } catch (err) {
        const backoff = 2 ** attempt * 100;
        await sleep(backoff);
      }
    }

    throw new Error("Gateway unavailable after retries");
  }
}

const formatUsd = (cents: Cents): string => `$${(cents / 100).toFixed(2)}`;
const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));
