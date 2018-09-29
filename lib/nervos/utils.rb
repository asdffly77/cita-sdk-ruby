module Nervos
  class Utils
    HEX_PREFIX = "0x"

    class << self
      # add `0x` prefix to hex string
      #
      # @param hex [String]
      def add_hex_prefix(hex)
        return if hex.nil?
        return hex if hex.start_with?(HEX_PREFIX)
        HEX_PREFIX + hex
      end

      # remove `0x` prefix from hex string
      #
      # @param hex [String]
      def remove_hex_prefix(hex)
        return if hex.nil?
        return hex.delete_prefix(HEX_PREFIX) if hex.start_with?(HEX_PREFIX)
        hex
      end

      # convert decimal value to hex string without `0x` prefix
      #
      # @param decimal [Integer]
      # @return [String]
      def to_hex(decimal)
        add_hex_prefix decimal.to_s(16)
      end

      # convert hex string to decimal value
      #
      # @param hex [String]
      # @return [Integer]
      def to_decimal(hex)
        hex.hex
      end

      # to byte code value
      # remove `0x` prefix first
      #
      # @param str [String] normal string
      # @return [String] byte code string
      def to_bytes(str)
        [Nervos::Utils.remove_hex_prefix(str)].pack("H*")
      end

      # byte code to string value, with `0x` prefix
      #
      # @param bytes_str [String] byte code string
      # @return [String] normal string
      def from_bytes(bytes_str)
        Nervos::Utils.add_hex_prefix(bytes_str.unpack1("H*"))
      end
    end
  end
end
